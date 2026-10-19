#!/usr/bin/env python3

from argparse import ArgumentParser
import pickle
import sys


if __name__ == '__main__':
    arg_parser = ArgumentParser(description='count words in file, and '
                                            'output dict as picle file')
    arg_parser.add_argument('input', help='file to parse')
    arg_parser.add_argument('--start', type=int, default=0,
                            help='first line to read (0-based)')
    arg_parser.add_argument('--end', type=int, default=1000000000,
                            help='last line to read, not inclusive '
                                 '(0-based)')
    arg_parser.add_argument('output', help='name of pickle output file')
    arg_parser.add_argument('--verbose', action='store_true',
                            help='verbose output')
    options = arg_parser.parse_args()
    count = {}
    with open(options.input, 'r') as in_file:
        for _ in range(options.start):
            _ = in_file.readline()
        for line_nr in range(options.start, options.end):
            line = in_file.readline().rstrip()
            if not line:
                break
            if options.verbose:
                print(f'processing line {line_nr}', file=sys.stderr)
            for word in line.split():
                if word not in count:
                    count[word] = 0
                count[word] += 1
    with open(options.output, 'wb') as out_file:
        pickle.dump(count, out_file)
