#!/usr/bin/env python

import argparse
import random


def create_data(file_name, nr_points):
    with open(file_name, 'w') as file:
        for _ in range(nr_points):
            x = random.uniform(-1.0, 1.0)
            y = random.uniform(-1.0, 1.0)
            print(f'{x},{y}\n', file=file)


def main():
    parser = argparse.ArgumentParser('Preprocess: create points')
    parser.add_argument('--points_file', type=str, required=True,
                        help='Data file to write')
    parser.add_argument('--nr_points', type=int, required=True,
                        help='Number of points to generate')
    args = parser.parse_args()

    create_data(args.points_file, args.nr_points)


if __name__ == '__main__':
    main()
