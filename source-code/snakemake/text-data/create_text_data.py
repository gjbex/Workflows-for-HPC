#!/usr/bin/env python
#
# Script to generate a random text file of a given size.
# The script takes the following arguments:
# `--words`: number of "words" to generate, default is 1.
# `--max-word-length`: maximum length of each word, default is 10.
# `--max-words-per-line`: maximum number of words to write per line, default is 1.
# `--char-set`: characters to use for generating words, default is alphanumeric.
# `--output-file`: output file to write to, if not specified, write to stdout.

import argparse
import random
import string
import sys

def generate_text_file(words, max_word_length, max_words_per_line, char_set, output_file):
    with open(output_file, 'w') if output_file else sys.stdout as f:
        for word_nr in range(words):
            word = ''.join(random.choice(char_set) for _ in range(random.randint(1, max_word_length)))
            f.write(word)
            if word_nr % max_words_per_line == 0:
                f.write('\n')
            else:
                f.write(' ')

def main():
    parser = argparse.ArgumentParser(description='Generate a random text file.')
    parser.add_argument('--words', type=int, default=1,
                        help='Number of words to generate.')
    parser.add_argument('--max-word-length', type=int, default=10,
                        help='Maximum length of each word.')
    parser.add_argument('--max-words-per-line', type=int, default=1,
                        help='Maximum number of words per line.')
    parser.add_argument('--char-set', type=str,
                        default=string.ascii_letters + string.digits,
                        help='Characters to use for generating words.')
    parser.add_argument('--output-file', type=str,
                        help='Output file to write to.')
    args = parser.parse_args()

    generate_text_file(args.words, args.max_word_length, args.max_words_per_line,
                       args.char_set, args.output_file)


if __name__ == '__main__':
    main()
