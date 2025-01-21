#!/usr/bin/env python


import argparse
import statistics


def process_input_file(file_name):
    with open(file_name) as file:
        values = [float(line) for line in file]
    return values


def compute_statistics(values):
    return statistics.mean(values), statistics.stdev(values)


def main():
    arg_parser = argparse.ArgumentParser(description='Process input data')
    arg_parser.add_argument('--input_file', required=True,
                            help='Input file name')
    arg_parser.add_argument('--output_file', required=True,
                            help='Output file name')
    options = arg_parser.parse_args()
    values = process_input_file(options.input_file)
    mean, stdev = compute_statistics(values)
    with open(options.output_file, 'w') as file:
        print(f'Mean: {mean}\nStandard deviation: {stdev}', file=file)


if __name__ == '__main__':
    main()
