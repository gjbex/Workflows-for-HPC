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
    left_only = left_words - right_words
    for word in left_only:
        print('< {word:s}: {count:10d}'.format(word=word,
                                               count=left_dict[word]))
    common = left_words.intersection(right_words)
    fmt_str = '{word:s}: <{l_count:10d} >{r_count:10d}'
    for word in common:
        if left_dict[word] != right_dict[word]:
            print(fmt_str.format(word=word, l_count=left_dict[word],
                                 r_count=right_dict[word]))
    right_only = right_words - left_words
    for word in right_only:
        print('< {word:s}: {count:10d}'.format(word=word,
                                               count=right_dict[word]))
