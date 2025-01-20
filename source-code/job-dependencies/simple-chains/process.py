#!/usr/bin/env python

import argparse
from itertools import batched, chain, combinations
import math
import multiprocessing


def distance(p1, p2):
   return math.sqrt((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)


def read_data(data_file):
    with open(data_file, 'r') as f:
        for line in f:
            x, y = line.strip().split(',')
            yield float(x), float(y)


def create_work(data_file, batch_size):
    points = read_data(data_file)
    data_pairs = ((p1, p2) for p1, p2 in combinations(points, 2))
    return batched(data_pairs, n=batch_size)


def process_batch(batch):
    return [distance(p1, p2) for p1, p2 in batch]


def main():
    arg_parser = argparse.ArgumentParser('Process: compute distances')
    arg_parser.add_argument('--data_file', type=str, required=True,
                            help='Data file to read')
    arg_parser.add_argument('--batch_size', type=int, required=True,
                            help='Batch size')
    arg_parser.add_argument('--nr_processes', type=int, required=True,
                            help='Number of processes to use')
    arg_parser.add_argument('--output_file', type=str, required=True,
                            help='Output file to write')
    options = arg_parser.parse_args()

    work = create_work(options.data_file, options.batch_size)
    with multiprocessing.Pool(options.nr_processes) as pool:
        results = pool.map(process_batch, work)
    with open(options.output_file, 'w') as file:
        for result in chain(*results):
            print(result, file=file)


if __name__ == '__main__':
    main()
