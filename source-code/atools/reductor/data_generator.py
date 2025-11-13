#!/usr/bin/env python3

from argparse import ArgumentParser
import random
import string


if __name__ == '__main__':
    arg_parser = ArgumentParser(description='generate random text file')
    arg_parser.add_argument('--lines', type=int, default=10,
                            help='number of lines to generate')
    arg_parser.add_argument('--words_per_line', type=int, default=15,
                            help='number of words per line')
    arg_parser.add_argument('--word_length', type=int, default=3,
                            help='word length')
    options = arg_parser.parse_args()
    for _ in range(options.lines):
        words = []
        for _ in range(options.words_per_line):
            word = ''
            for _ in range(options.word_length):
                word += random.choice(string.ascii_lowercase)
            words.append(word)
        print(' '.join(words))
