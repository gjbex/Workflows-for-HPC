#!/usr/bin/env python

import argparse
import pathlib
import random


def create_input_file(file_name, nr_values):
    with open(file_name, 'w') as file:
        for _ in range(nr_values):
            print(random.uniform(0.0, 1.0), file=file)


def create_input(directory_name, nr_files, min_nr_values=10, max_nr_values=1_000):
    directory = pathlib.Path(directory_name)
    directory.mkdir(exist_ok=True)
    for i in range(1, nr_files + 1):
        file_name = directory / f'data_{i:03d}.dat'
        nr_values = random.randint(min_nr_values, max_nr_values)
        create_input_file(file_name, nr_values)


def main():
    arg_parser = argparse.ArgumentParser(description='Create input data')
    arg_parser.add_argument('--directory', required=True,
                            help='Directory to store input files')
    arg_parser.add_argument('--nr_files', type=int, default=10,
                            help='Number of files to create')
    arg_parser.add_argument('--min_nr_values', type=int, default=10,
                            help='Minimum number of values per file')
    arg_parser.add_argument('--max_nr_values', type=int, default=1_000,
                            help='Maximum number of values per file')
    options = arg_parser.parse_args()
    create_input(options.directory, options.nr_files,
                 options.min_nr_values, options.max_nr_values)


if __name__ == '__main__':
    main()
