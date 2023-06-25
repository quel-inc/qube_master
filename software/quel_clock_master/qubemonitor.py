import logging
import struct
from typing import Final, Tuple, Union

from quel_clock_master.simpleudpclient import SimpleUdpClient

logger = logging.getLogger()


class QuBEMonitor(SimpleUdpClient):
    DEFAULT_PORT: Final[int] = 16385

    def __init__(
        self,
        target_ipaddr: str,
        target_port: Union[int, None] = None,
        receiver_limit_by_bind: bool = False,
        timeout=SimpleUdpClient.DEFAULT_TIMEOUT,
    ):
        super().__init__(target_ipaddr, receiver_limit_by_bind, timeout)
        self._port: int = self.DEFAULT_PORT if target_port is None else target_port

    def read_clock(self) -> Tuple[bool, int]:
        data = struct.pack("BBBB", 0x00, 0x00, 0x00, 0x04)

        logger.debug(f"sending {':'.join(['{0:02x}'.format(x) for x in data])}")
        reply, raddr = self._send_recv_generic(self._port, data)
        if raddr is None:
            logger.warning("communication failure in clear_clock()")
            clock = -1
        else:
            logger.debug(f"receiving {':'.join(['{0:02x}'.format(x) for x in reply])} from {raddr[0]:s}:{raddr[1]:d}")
            # if reply[0] != 0x33:
            #    logger.warning("unexpected reply packet starting with {reply[0]:02x} is received")

            clock = struct.unpack(">Q", reply[4:12])[0]

        return (raddr is not None), clock


if __name__ == "__main__":
    import argparse

    logging.basicConfig(level=logging.DEBUG, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = argparse.ArgumentParser()
    parser.add_argument("ipaddr_targets", type=str, nargs="+", help="IP addresses of the target boxes")
    parser.add_argument("--port", type=int, default=QuBEMonitor.DEFAULT_PORT)
    args = parser.parse_args()

    for ipaddr_target in args.ipaddr_targets:
        q = QuBEMonitor(ipaddr_target, args.port)
        retcode, clock = q.read_clock()
        if retcode:
            logger.info(f"{ipaddr_target}: {clock}")
        else:
            logger.info(f"{ipaddr_target}: error")
