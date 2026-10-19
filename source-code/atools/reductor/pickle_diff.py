#!/usr/bin/env python

from argparse import ArgumentParser
import pickle

if __name__ == '__main__':
    arg_parser = ArgumentParser(description='compare two pickle files '
                                            'storing a dict')
    arg_parser.add_argument('left', help='first pickle file')
    arg_parser.add_argument('right', help='second pickle file')
    options = arg_parser.parse_args()
    with open(options.left, 'rb') as left_file:
        left_dict = pickle.load(left_file)
    with open(options.right, 'rb') as right_file:
        right_dict = pickle.load(right_file)
    left_words = set(left_dict.keys())
    right_words = set(right_dict.keys())
    for word in left_words - right_words:
        print(f'< {word}: {left_dict[word]}')
    for word in left_words & right_words:
        if left_dict[word] != right_dict[word]:
            print(f'{word}: <{left_dict[word]} >{right_dict[word]}')
    for word in right_words - left_words:
        print(f'> {word}: {right_dict[word]}')
