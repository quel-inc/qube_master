import logging
import socket
import struct
from typing import Final, List, Sequence, Tuple, Union, cast

logger = logging.getLogger(__name__)


class QuBEMasterClient:
    BUFSIZE: Final[int] = 16384  # bytes
    MAX_RW_SIZE: Final[int] = 1440  # bytes
    TIMEOUT: Final[float] = 2.0  # s

    def __init__(self, ip_addr, port, reset_port):
        self._master_ip_addr: str = ip_addr
        self._master_port: int = port
        self._master_reset_port: int = reset_port
        self._sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self._sock.settimeout(self.TIMEOUT)
        self._sock.bind(("", 0))
        logger.debug(f"open socket to clock master at {ip_addr}:{port}")

    # TODO: limiting source address of the reply.
    def send_recv(self, data: bytes, is_reset: bool = False) -> Tuple[bytes, Union[Tuple[str, int], None]]:
        port = self._master_port if not is_reset else self._master_reset_port
        try:
            self._sock.sendto(data, (self._master_ip_addr, port))
            reply, addr = self._sock.recvfrom(self.BUFSIZE)
            return reply, cast(Tuple[str, int], addr)
        except socket.timeout:
            logger.warning(f"failed to receive a reply from {(self._master_ip_addr, port)} due to timeout")
            return b"", None
        except Exception as e:
            logger.exception(e)
            raise

    # TODO: improving packet assembling. the current implementation causes many buffer-copy.
    def kick_clock_synch(self, target_addrs: Sequence[str]) -> bool:
        targets: List[Tuple[int, int]] = [(self._conv2addr(a), 0x4001) for a in target_addrs]

        data = struct.pack("BBHHH", 0x32, 0, 0, 0, 0)
        for addr, port in targets:
            data += struct.pack(">I", addr)
            data += struct.pack(">I", port)
        if len(data) > self.MAX_RW_SIZE:
            raise ValueError("too many targets")

        logger.debug(f"sending {':'.join(['{0:02x}'.format(x) for x in data])}")
        reply, raddr = self.send_recv(data)
        if raddr is not None:
            logger.debug(f"receiving {':'.join(['{0:02x}'.format(x) for x in reply])} from {raddr[0]:s}:{raddr[1]:d}")

        if raddr == (self._master_ip_addr, self._master_port) and reply[0] in (0xFE, 0xFF):
            logger.warning(
                "a state machine of the clock master may be hanged up, please **RESET** it before re-trying 'kick'."
            )

        return raddr == (self._master_ip_addr, self._master_port) and reply[0] == 0x33

    def clear_clock(self, value: int = 0) -> bool:
        data = struct.pack("BBHHH", 0x34, 0, 0, 0, 0)
        data += struct.pack("<Q", value)

        logger.debug(f"sending {':'.join(['{0:02x}'.format(x) for x in data])}")
        reply, raddr = self.send_recv(data)
        if raddr is not None:
            logger.debug(f"receiving {':'.join(['{0:02x}'.format(x) for x in reply])} from {raddr[0]:s}:{raddr[1]:d}")

        return raddr == (self._master_ip_addr, self._master_port) and reply[0] == 0x33

    def read_clock(self, value: int = 0) -> Tuple[bool, int]:
        data = struct.pack("BBHHH", 0x30, 0, 0, 0, 0)
        data += struct.pack("<Q", value)

        logger.debug(f"sending {':'.join(['{0:02x}'.format(x) for x in data])}")
        reply, raddr = self.send_recv(data)
        if raddr is not None:
            logger.debug(f"receiving {':'.join(['{0:02x}'.format(x) for x in reply])} from {raddr[0]:s}:{raddr[1]:d}")
            result = struct.unpack("<Q", reply[8:])[0]
        else:
            result = -1
        return (raddr == (self._master_ip_addr, self._master_port) and reply[0] == 0x33), result

    def reset(self) -> bool:
        data = "dummy message".encode("utf-8")
        logger.debug(f"sending {':'.join(['{0:02x}'.format(x) for x in data])}")
        reply, raddr = self.send_recv(data, is_reset=True)
        if raddr is not None:
            logger.debug(
                f"receiving from reset {':'.join(['{0:02x}'.format(x) for x in reply])} from {raddr[0]:s}:{raddr[1]:d}"
            )
        return raddr == (self._master_ip_addr, self._master_reset_port) and reply == b"dummy message"

    def _conv2addr(self, addr_str: str) -> int:
        a = 0
        for s in addr_str.split("."):
            a = (a << 8) | int(s)
        return a


if __name__ == "__main__":
    import argparse
    import sys

    logging.basicConfig(level=logging.DEBUG, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = argparse.ArgumentParser()
    parser.add_argument("--ipaddr_master", required=True)
    parser.add_argument("--port", type=int, default="16384")
    parser.add_argument("--reset_port", type=int, default="16385")
    parser.add_argument("--command", choices=("clear", "read", "kick", "reset"), required=True)
    parser.add_argument("--value", type=int, default=0)
    parser.add_argument("ipaddr_targets", type=str, nargs="*")
    args = parser.parse_args()

    proxy = QuBEMasterClient(args.ipaddr_master, args.port, args.reset_port)
    retcode: bool = False

    if args.command == "clear":
        retcode = proxy.clear_clock(value=args.value)
        if retcode:
            logger.info("cleared successfully")
        else:
            logger.error("failure in cleaning")
    elif args.command == "read":
        retcode, clock = proxy.read_clock(value=args.value)
        if retcode:
            logger.info(f"the clock reading is '{clock:d}'")
        else:
            logger.error("failure in reading the clock")
    elif args.command == "kick":
        if len(args.ipaddr_targets) > 0:
            retcode = proxy.kick_clock_synch(args.ipaddr_targets)
            if retcode:
                logger.info("kicked successfully")
            else:
                logger.error("failure in kicking the targets")
        else:
            logger.error("'kick' command requires IP addresses of targets")
    elif args.command == "reset":
        retcode = proxy.reset()
        if retcode:
            logger.info("reset successfully")
        else:
            logger.error("failure in reset")
    else:
        # this cannot happen.
        raise AssertionError

    if not retcode:
        sys.exit(1)
