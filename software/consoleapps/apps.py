import argparse
import logging
import sys

from quel_clock_master import QuBEMasterClient, QuBEMonitor

logger = logging.getLogger(__name__)


def init_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser()
    parser.add_argument("ipaddr_master", type=str, help="IP address of the clock master")
    parser.add_argument("--port", type=int, default="16384")
    parser.add_argument("--reset_port", type=int, default="16385")
    return parser


def reset_main():
    logging.basicConfig(level=logging.INFO, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = init_parser()
    args = parser.parse_args()
    proxy = QuBEMasterClient(args.ipaddr_master, args.port, args.reset_port)

    retcode = proxy.reset()
    if retcode:
        logger.info("reset successfully")
        sys.exit(0)
    else:
        logger.error("failure in reset")
        sys.exit(1)


def read_master_main():
    logging.basicConfig(level=logging.INFO, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = init_parser()
    args = parser.parse_args()
    proxy = QuBEMasterClient(args.ipaddr_master, args.port, args.reset_port)

    retcode, clock = proxy.read_clock(0)
    if retcode:
        logger.info(f"{args.ipaddr_master}: {clock:d}")
        sys.exit(0)
    else:
        logger.error("failure in reading the clock")
        sys.exit(1)


def clear_main():
    logging.basicConfig(level=logging.INFO, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = init_parser()
    parser.add_argument("ipaddr_targets", type=str, nargs="*", help="IP addresses of target boxes to kick")
    args = parser.parse_args()
    proxy = QuBEMasterClient(args.ipaddr_master, args.port, args.reset_port)

    retcode = proxy.clear_clock(0)
    if retcode:
        logger.info("cleared successfully")
    else:
        logger.error("failure in cleaning")
        sys.exit(1)

    if len(args.ipaddr_targets) > 0:
        retcode = proxy.kick_clock_synch(args.ipaddr_targets)
        if retcode:
            logger.info("kicked successfully")
        else:
            logger.error("failure in kicking the targets")
            sys.exit(1)
    else:
        logger.info("no kick is conducted because no targets are given")


def kick_main():
    logging.basicConfig(level=logging.INFO, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = init_parser()
    parser.add_argument("ipaddr_targets", type=str, nargs="+", help="IP addresses of target boxes to kick")
    args = parser.parse_args()
    proxy = QuBEMasterClient(args.ipaddr_master, args.port, args.reset_port)

    retcode = proxy.kick_clock_synch(args.ipaddr_targets)
    if retcode:
        logger.info("kicked successfully")
    else:
        logger.error("failure in kicking the targets")
        sys.exit(1)


def read_target_main():
    logging.basicConfig(level=logging.INFO, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = init_parser()
    parser.add_argument("ipaddr_targets", type=str, nargs="+", help="IP addresses of the target boxes")
    parser.add_argument("--port_monitor", type=int, default=QuBEMonitor.DEFAULT_PORT)
    args = parser.parse_args()

    flag = True
    for ipaddr_target in args.ipaddr_targets:
        q = QuBEMonitor(ipaddr_target, args.port_monitor)
        retcode, clock = q.read_time()
        if retcode:
            logger.info(f"{ipaddr_target}: {clock:d}")
        else:
            logger.info(f"{ipaddr_target}: not found")
            flag = False

    sys.exit(0 if flag else 1)


def read_main():
    logging.basicConfig(level=logging.INFO, format="{asctime} [{levelname:.4}] {name}: {message}", style="{")

    parser = init_parser()
    parser.add_argument("ipaddr_targets", type=str, nargs="*", help="IP addresses of the target boxes")
    parser.add_argument("--port_monitor", type=int, default=QuBEMonitor.DEFAULT_PORT)
    args = parser.parse_args()
    proxy = QuBEMasterClient(args.ipaddr_master, args.port, args.reset_port)

    flag = True
    retcode, clock = proxy.read_clock(0)
    if retcode:
        logger.info(f"{args.ipaddr_master}: {clock:d}")
    else:
        logger.info(f"{args.ipaddr_master}: not found")
        flag = False

    for ipaddr_target in args.ipaddr_targets:
        q = QuBEMonitor(ipaddr_target, args.port_monitor)
        retcode, clock = q.read_time()
        if retcode:
            logger.info(f"{ipaddr_target}: {clock:d}")
        else:
            logger.info(f"{ipaddr_target}: not found")
            flag = False

    sys.exit(0 if flag else 1)
