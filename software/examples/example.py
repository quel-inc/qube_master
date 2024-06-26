import argparse

from quel_clock_master import QuBEMasterClient, SequencerClient

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--ipaddr", default="10.3.0.255")
    parser.add_argument("--port", type=int, default="16384")
    parser.add_argument("--value", type=int, default=0)
    parser.add_argument("--sec", type=int, default=10)
    parser.add_argument("destinations", nargs="*")
    args = parser.parse_args()

    cycles = args.sec * 125000000  # 125Mcycls = 1sec

    client = QuBEMasterClient(args.ipaddr, int(args.port))
    print("clear")
    r, a = client.clear_clock(value=args.value)
    print("kick")
    r, a = client.kick_clock_synch(args.destinations)

    print("read")
    ret = client.read_clock(value=args.value)
    print("read result", ret, "cycles")

    print("run @", ret + cycles)
    for a in args.destinations:
        client = SequencerClient(a, int(args.port))
        r, a = client.add_sequencer(ret + cycles)  # make registration

    next_trigger = ret + cycles + 60 * 125000000
    print("run @", next_trigger)
    for a in args.destinations:
        client = SequencerClient(a, int(args.port))
        r, a = client.add_sequencer(next_trigger)  # make registration
