import argparse

from icecream import ic

from dashboard_data_parser import *
from ssh_honeypot import *
from web_app import *
from web_honeypot import *

if __name__ == "__main__":

    # create parser
    parser = argparse.ArgumentParser()

    # add arguments to parser | these are used in terminal command
    parser.add_argument("-a", "--address", type=str, required=True)
    parser.add_argument("-p", "--port", type=int, required=True)
    parser.add_argument("-u", "--username", type=str)
    parser.add_argument("-w", "--password", type=str)
    parser.add_argument("-s", "--ssh", action="store_true")
    parser.add_argument("-t", "--tarpit", action="store_true")
    parser.add_argument("-wh", "--http", action="store_true")
    args = parser.parse_args()

    # parse args based on user supplied arg
    try:
        if args.ssh:
            ic("running http wordpress honeypot")
            honeypot(args.address, args.port, args.username, args.password, args.tarpit)

        elif args.http:
            if args.nocountry:
                pass_country_status(True)
            if not args.username:
                args.username = "admin"
                ic("running with default username of admin")
            if not args.password:
                args.password = "whakawhaka"
                ic("running with default password of whakawhaka")
            ic(f"port: {args.port} username: {args.username} password: {args.password}")
            run_app(args.port, args.username, args.password)

        else:
            ic(
                "you can only choose SSH (-s) (--ssh) or HTTP (-h) (--http) when running script"
            )

    except KeyboardInterrupt:
        ic("\n program exited")
