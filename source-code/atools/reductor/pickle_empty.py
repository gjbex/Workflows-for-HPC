#!/usr/bin/env python

from argparse import ArgumentParser
import pickle

if __name__ == '__main__':
    arg_parser = ArgumentParser(description='create pickle file of empty '
                                            'dictionary')
    arg_parser.add_argument('out', help='name of the pickle file')
    options = arg_parser.parse_args()
    counter = dict()
    with open(options.out, 'wb') as out_file:
        pickle.dump(counter, out_file)
