import socket
import struct


class SequencerClient(object):
    BUFSIZE = 16384  # bytes
    MAX_RW_SIZE = 1440  # bytes
    TIMEOUT = 25  # sec

    def __init__(self, ip_addr, port):
        self.__dest_addr = (ip_addr, port)
        self.__sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.__sock.settimeout(self.TIMEOUT)
        self.__sock.bind(("", 0))
        print("open: {}:{}".format(ip_addr, port))

    def send_recv(self, data):
        try:
            self.__sock.sendto(data, self.__dest_addr)
            return self.__sock.recvfrom(self.BUFSIZE)
        except socket.timeout as e:
            print("{},  Dest {}".format(e, self.__dest_addr))
            raise
        except Exception as e:
            print(e)
            raise

    def kick_softreset(self):
        data = struct.pack('BBBB', 0xE0, 0x00, 0x00, 0x00)
        ret,addr = self.send_recv(data)
        print(ret)

    def add_sequencer(self, value):
        data = struct.pack("BB", 0x22, 0)
        data += struct.pack("HH", 0, 0)
        data += struct.pack(">H", 16)  # 1-command = 16bytes
        data += struct.pack("<Q", value)  # start time
        data += struct.pack("<H", 0xFFFF)  # target AWG
        data += struct.pack("BBBBB", 0, 0, 0, 0, 0)  # padding
        data += struct.pack("B", 0)  # entry id
        return self.send_recv(data)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default="16384", help="port to SequencerUnit")
    parser.add_argument("--command", type=str, choices=("sched", "reset"), required=True, help="command to execute")
    parser.add_argument("--sec", type=int, default=10, help="scheduled time in seconds to start AWGs")
    parser.add_argument("ipaddr_targets", type=str, nargs="+", help="IP addresses of the target boxes")
    args = parser.parse_args()

    for ipaddr_target in args.ipaddr_targets:
        target = SequencerClient(ipaddr_target, args.port)
        if args.command == "reset":
            target.kick_softreset()
        elif args.command == "sched":
            r, a = target.add_sequencer(args.sec * 125000000)  # 125M = 1sec
            print(r, a)
        else:
            # never happens
            raise AssertionError
