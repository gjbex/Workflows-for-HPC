#!/usr/bin/env python

import argparse
from itertools import batched, chain, combinations
import math
import multiprocessing


def distance(p1, p2):
   return math.sqrt((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)


def read_data(points_file):
    with open(points_file, 'r') as f:
        for line in f:
            x, y = line.strip().split(',')
            yield float(x), float(y)


def create_work(points_file, batch_size):
    points = read_data(points_file)
    points_pairs = ((p1, p2) for p1, p2 in combinations(points, 2))
    return batched(points_pairs, n=batch_size)


def process_batch(batch):
    return [distance(p1, p2) for p1, p2 in batch]


def main():
    arg_parser = argparse.ArgumentParser(description='Process: compute distances')
    arg_parser.add_argument('--points_file', type=str, required=True,
                            help='Data file to read with x, y points')
    arg_parser.add_argument('--batch_size', type=int, required=True,
                            help='Batch size')
    arg_parser.add_argument('--nr_processes', type=int, required=True,
                            help='Number of processes to use')
    arg_parser.add_argument('--distances_file', type=str, required=True,
                            help='Output file to write with distances')
    options = arg_parser.parse_args()

    work = create_work(options.points_file, options.batch_size)
    with multiprocessing.Pool(options.nr_processes) as pool:
        results = pool.map(process_batch, work)
    with open(options.distances_file, 'w') as file:
        for result in chain(*results):
            print(result, file=file)


if __name__ == '__main__':
    main()
