#!/usr/bin/env python3

import argparse
import pandas as pd
import random


def parse_args():
    parser = argparse.ArgumentParser(description='Aggregate data by ID and compute sum of a specified column.')
    parser.add_argument('--input_files', nargs='+', required=True,
                        help='Input CSV file name')
    parser.add_argument('--output_file', required=True,
                        help='Output CSV file name')
    return parser.parse_args()


def join(dfs):
    df = dfs.pop(0)
    for next_df in dfs:
        df = df.merge(next_df, on='id', how='outer')
    return df


def main():
    args = parse_args()
    dfs = [pd.read_csv(input_file) for input_file in args.input_files]
    new_df = join(dfs)
    new_df.to_csv(args.output_file, index=False)


if __name__ == '__main__':
    main()
