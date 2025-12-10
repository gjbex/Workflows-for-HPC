#!/usr/bin/env python3

from argparse import ArgumentParser
import pickle

if __name__ == '__main__':
    arg_parser = ArgumentParser(description='create pickle file of empty '
                                            'dictionary')
    arg_parser.add_argument('out', help='name of the pickle file')
    options, _ = arg_parser.parse_known_args()
    counter = {}
    with open(options.out, 'wb') as out_file:
        pickle.dump(counter, out_file)
