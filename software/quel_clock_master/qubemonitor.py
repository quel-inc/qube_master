import socket
import struct

class QuBEMonitor(object):
    BUFSIZE = 16384
    TIMEOUT = 25

    def __init__(self, ip_addr, port):
        self.__ipaddr = ip_addr
        self.__port = port
        self.__sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.__sock.settimeout(self.TIMEOUT)
        self.__sock.bind(('', 0))
        print('open: {}:{}'.format(ip_addr, port))

    def send_recv(self, data):
        try:
            self.__sock.sendto(data, (self.__ipaddr, self.__port))
            return self.__sock.recvfrom(self.BUFSIZE)
        except socket.timeout as e:
            print('{},  Dest {}'.format(e, (self.__ipaddr, self.__port)))
            raise
        except Exception as e:
            print(e)
            raise

    def read_time(self):
        data = struct.pack('BBBB', 0x00, 0x00, 0x00, 0x04)
        ret,addr = self.send_recv(data)
        return struct.unpack('>Q', ret[4:12])[0]

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser()
    parser.add_argument("ipaddr_targets", type=str, nargs="+", help="IP addresses of the target boxes")
    parser.add_argument('--port', type=int, default='16385')
    args = parser.parse_args()

    for ipaddr_target in args.ipaddr_targets:
        q = QuBEMonitor(ipaddr_target, args.port)
        print(ipaddr_target, q.read_time())
