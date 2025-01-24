#!/usr/bin/env python
#
# Script to convert a TIFF file to a numpy array.
# The numpy array is saved as a .npy file.
# The script takes the name of the TIFF file as an argument and
# saves the numpy array as a .npy file with the same name.

import argparse
import numpy as np
import pathlib
import skimage.io as io


def main():
    parser = argparse.ArgumentParser(description='Convert a TIFF file to a numpy array')
    parser.add_argument('tiff_file', type=str, help='Name of the TIFF file')
    args = parser.parse_args()
    img = io.imread(args.tiff_file)
    npy_file = pathlib.Path(args.tiff_file).with_suffix('.npy')
    np.save(npy_file, img)


if __name__ == '__main__':
    main()
