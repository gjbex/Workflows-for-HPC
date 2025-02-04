#!/usr/bin/env python
#
# Script to convert a TIFF file to a numpy array.
# The numpy array is saved as a .npy file.
# The script takes the name of the TIFF file as an argument and
# saves the numpy array as a .npy file with the same name.

import argparse
from datasets import load_dataset, load_from_disk
import torch

def main():
    parser = argparse.ArgumentParser(description='Convert a TAR files with TIFF images to a PyTorch tensor dataset')
    parser.add_argument('tar_file_dir', help='Name of directory that holds the TAR files')
    parser.add_argument('output_dir', help='Name of directory to save the PyTorch tensor dataset')
    args = parser.parse_args()

    dataset = load_dataset('webdataset', data_dir=args.tar_file_dir)
    dataset = dataset.with_format('torch')
    dataset.save_to_disk(args.output_dir)

if __name__ == '__main__':
    main()
