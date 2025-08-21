#!/usr/bin/env python3

import argparse
import pandas as pd
import random


def parse_args():
    parser = argparse.ArgumentParser(description='Generate synthetic data.')
    parser.add_argument('--nr_rows', type=int, default=1000,
                        help='Number of rows to generate')
    parser.add_argument('--nr_ids', type=int, default=5,
                        help='Number of distinct IDs')
    parser.add_argument('--column_name', required=True,
                        help='Nname of the data column')
    parser.add_argument('--output_file', type=str, required=True,
                        help='Output CSV file name')
    return parser.parse_args()


def generate_data(nr_rows, nr_ids, column_name):
    data = {
        'id': [random.randint(1, nr_ids) for _ in range(nr_rows)],
        column_name: [random.uniform(0.0, 100.0) for _ in range(nr_rows)]
    }
    return pd.DataFrame(data)


def main():
    args = parse_args()
    df = generate_data(args.nr_rows, args.nr_ids, args.column_name)
    df.to_csv(args.output_file, index=False)


if __name__ == '__main__':
    main()
