#!/usr/bin/env python

# Script that concatenates a CSV file to a Huggingface dataset.
# The script takes a CSV file name pattern and a label file name as positional arguments.
# The output is written to the name specified as the third argument.
# The script uses the pathlib library to handle file paths.

import argparse
from datasets import Dataset
import pandas as pd
from pathlib import Path


def concat_txt_to_arrow(data_pattern, label_file_name):
    data_file_names = [str(file) for file in list(Path().glob(data_pattern))]
    dataset = Dataset.from_text(data_file_names)
    label_df = pd.read_csv(label_file_name).sort_values('filename')
    for column in label_df.columns:
        dataset = dataset.add_column(column, label_df[column].to_list())
    return dataset


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('txt_pattern', help='text file name pattern')
    parser.add_argument('label_file_name', help='CSV file name that stores the labels')
    parser.add_argument('output', help='dataset name to concatenate to')
    args = parser.parse_args()

    dataset = concat_txt_to_arrow(args.txt_pattern, args.label_file_name)
    dataset.save_to_disk(args.output)

if __name__ == '__main__':
    main()
