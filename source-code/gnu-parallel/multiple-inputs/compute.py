#!/usr/bin/env python

import argparse


def compute(x, y):
    return x*y


if __name__ == '__main__':
    arg_parser = argparse.ArgumentParser(description='Compute product')
    arg_parser.add_argument('--x', type=int, required=True,  help='First operaand')
    arg_parser.add_argument('--y', type=int, required=True, help='Second operaand')
    args = arg_parser.parse_args()
    print(compute(args.x, args.y))
