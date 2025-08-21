#!/usr/bin/env python3

import argparse
import pandas as pd
import random


def parse_args():
    parser = argparse.ArgumentParser(description='Aggregate data by ID and compute sum of a specified column.')
    parser.add_argument('--input_file', required=True,
                        help='Input CSV file name')
    parser.add_argument('--column_name', required=True,
                        help='Nname of the data column')
    parser.add_argument('--output_file', required=True,
                        help='Output CSV file name')
    return parser.parse_args()


def process_data(df, column_name):
    new_df = df[['id', column_name]].groupby('id').sum().reset_index()
    return new_df


def main():
    args = parse_args()
    df = pd.read_csv(args.input_file)
    if args.column_name not in df.columns:
        raise ValueError(f"Column '{args.column_name}' not found in the input file.")
    new_df = process_data(df, args.column_name)
    new_df.to_csv(args.output_file, index=False)


if __name__ == '__main__':
    main()
