#!/usr/bin/env python

from argparse import ArgumentParser
import pickle

if __name__ == '__main__':
    arg_parser = ArgumentParser(description='create new pickle file from '
                                            'two existing files')
    arg_parser.add_argument('old', help='name of aggregation pickle file')
    arg_parser.add_argument('new', help='name of pickel file to add to '
                                        'aggregation')
    options = arg_parser.parse_args()
    with open(options.old, 'rb') as old_file:
        old_data = pickle.load(old_file)
    with open(options.new, 'rb') as new_file:
        new_data = pickle.load(new_file)
    for word, count in new_data.iteritems():
        if word in old_data:
            old_data[word] += count
        else:
            old_data[word] = count
    with open(options.old, 'wb') as old_file:
        pickle.dump(old_data, old_file)
