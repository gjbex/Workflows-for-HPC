#!/usr/bin/env python

import argparse


if __name__ == '__main__':
    arg_parser = argparse.ArgumentParser('Fail or not')
    arg_parser.add_argument('x', type=int, help='First operand')
    arg_parser.add_argument('y', type=int, help='Second operand')
    arg_parser.add_argument('--fix', action='store_true', help="Don't fail")
    args = arg_parser.parse_args()
    try:
        print(args.x/args.y)
    except Exception as e:
        if not args.fix:
            raise e
        else:
            print('initify')
