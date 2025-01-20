#!/usr/bin/env python


import argparse
import math


def computing_histogram(data, nr_bins, min_value=None, max_value=None):
    if min_value is None:
        min_value = min(data)
    if max_value is None:
        max_value = max(data)
    bin_width = (max_value - min_value)/nr_bins
    histogram = [0] * nr_bins
    for value in data:
        bin_nr = int((value - min_value)/bin_width)
        if bin_nr == nr_bins:
            bin_nr -= 1
        histogram[bin_nr] += 1
    return histogram


def main():
    arg_parser = argparse.ArgumentParser('Postprocess: create histogram')
    arg_parser.add_argument('--data_file', type=str, required=True,
                            help='Data file to read')
    arg_parser.add_argument('--nr_bins', type=int, required=True,
                            help='Number of bins')
    arg_parser.add_argument('--min_value', type=float, default=0.0,
                            help='Minimum value')
    arg_parser.add_argument('--max_value', type=float,
                            default=2.0*math.sqrt(2.0),
                            help='Maximum value')
    arg_parser.add_argument('--output_file', type=str, required=True,
                            help='Output file to write')
    options = arg_parser.parse_args()
    with open(options.data_file, 'r') as f:
        data = [float(line.strip()) for line in f]
    histogram = computing_histogram(
            data, options.nr_bins,
            options.min_value, options.max_value
    )
    with open(options.output_file, 'w') as output:
        left_edge = options.min_value
        delta = (options.max_value - options.min_value)/options.nr_bins
        for value in histogram:
            print(f'{left_edge}, {value}', file=output)
            left_edge += delta


if __name__ == '__main__':
    main()
