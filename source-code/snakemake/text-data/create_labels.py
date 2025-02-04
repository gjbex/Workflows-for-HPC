#!/usr/bin/env python
#
# Script to create labels for datasets
# The script takes two arguments:
#  - the pathlib compatible glob pattern to the dataset
#  - a list of Python types and distinct values to be used as labels, possible values are:
#    - int: values between 0 and given value
#    - float: values between 0 and 1, if a value is specified, it is ignored
#    - str: values between 'A' and chr(ord('A') + given value)
#
# Example:
# python create_labels.py 'data/*.jpg' int:3 float str:4
# The result is a CSV file with the name of the file as the first column,
# and oe additional column for each of the types provided.  The first column
# header is 'filename', and the subsequent columns 'class_0', 'class_1', etc.
# The vales of the labels are randomly assigned to each file.
#
# Command line arguments are handled with argparse, and the script uses the csv
# module to write the output file.  The string representation of the types is
# converted to actual Python types using pydoc.locate.

import argparse
import csv
import pathlib
import random

def create_header(types):
    header = ['filename']
    for i, t in enumerate(types):
        if t.startswith('int:'):
            header.append(f'class_{i}')
        elif t.startswith('float'):
            header.append(f'class_{i}')
        elif t.startswith('str:'):
            header.append(f'class_{i}')
        else:
            raise ValueError(f'Unknown type {t}')
    return header

def create_labels(file, types):
    label = [file]
    for t in types:
        if t.startswith('int:'):
            label.append(str(random.randrange(0, int(t[4:]))))
        elif t.startswith('float'):
            label.append(str(random.random()))
        elif t.startswith('str:'):
            label.append(chr(ord('A') + random.randrange(0, int(t[4:]))))
        else:
            raise ValueError(f'Unknown type {t}')
    return label

def main():
    parser = argparse.ArgumentParser(description='Create labels for datasets')
    parser.add_argument('pattern', help='Glob pattern to the dataset')
    parser.add_argument('--types', nargs='+', help='List of types and values')
    parser.add_argument('-o', '--output', help='Output file name', default='labels.csv')
    args = parser.parse_args()

    with open(args.output, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(create_header(args.types))
        for file in pathlib.Path().glob(args.pattern):
            writer.writerow(create_labels(file, args.types))

if __name__ == '__main__':
    main()
