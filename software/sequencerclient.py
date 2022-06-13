import sys
import argparse
import socket
import struct

class SequencerClient(object):

    BUFSIZE = 16384 # bytes
    MAX_RW_SIZE = 1440 # bytes
    TIMEOUT = 25 # sec

    def __init__(self, ip_addr, port):
        self.__dest_addr = (ip_addr, port)
        self.__sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self.__sock.settimeout(self.TIMEOUT)
        self.__sock.bind(('', 0))
        print('open: {}:{}'.format(ip_addr, port))

    def send_recv(self, data):
        try:
            self.__sock.sendto(data, self.__dest_addr)
            return self.__sock.recvfrom(self.BUFSIZE)
        except socket.timeout as e:
            print('{},  Dest {}'.format(e, self.__dest_addr))
            raise
        except Exception as e:
            print(e)
            raise

    def add_sequencer(self, value):
        data = struct.pack('BB', 0x22, 0)
        data += struct.pack('HH', 0, 0)
        data += struct.pack('>H', 16) # 1-command = 16bytes
        data += struct.pack('<Q', value | 0x1000000000000000) # start time with MSB=1
        data += struct.pack('<H', 0xFFFF) # target AWG
        data += struct.pack('BBBBB', 0, 0, 0, 0, 0) # padding
        data += struct.pack('B', 0) # entry id
        return self.send_recv(data)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--ipaddr', default='10.2.0.255')
    parser.add_argument('--port', type=int, default='16384')
    parser.add_argument('--time', type=int, default=10*125000000) # 125M = 1sec
    args = parser.parse_args()

    client = SequencerClient(args.ipaddr, int(args.port))
    r, a = client.add_sequencer(args.time)
    print(r, a)
