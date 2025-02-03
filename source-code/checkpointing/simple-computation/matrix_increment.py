#!/usr/bin/env python

import argparse
import sys


def init_matrix(nr_rows, nr_cols):
    return [[0] * nr_cols for _ in range(nr_rows)]


def increment_matrix(matrix):
    return [[cell + 1 for cell in row] for row in matrix]


def compute_sum(matrix):
    return sum(sum(row) for row in matrix)


def main():
    arg_parser = argparse.ArgumentParser(description='Increment a matrix')
    arg_parser.add_argument('--nr_rows', type=int, default=10,
                        help='Number of rows in the matrix')
    arg_parser.add_argument('--nr_cols', type=int, default=10,
                        help='Number of columns in the matrix')
    arg_parser.add_argument('--max_iters', type=int, default=10,
                        help='Number of times to increment the matrix')
    arg_parser.add_argument('--feedback_iters', type=int, default=100,
                            help='Number of iterations after which to print progess info')
    arg_parser.add_argument('--output', type=str, default='output.txt',
                         help='Output file')
    args = arg_parser.parse_args()

    matrix = init_matrix(args.nr_rows, args.nr_cols)
    with open(args.output, 'w') as output_file:
        iter_nr = 0
        print(f'{iter_nr:8d} {compute_sum(matrix)}', file=output_file)
        for iter_nr in range(1, args.max_iters + 1):
            matrix = increment_matrix(matrix)
            print(f'{iter_nr:8d} {compute_sum(matrix)}', file=output_file)
            if iter_nr % args.feedback_iters == 0:
                print(f'{iter_nr:08d} done', file=sys.stderr, flush=True)



if __name__ == '__main__':
    main()
