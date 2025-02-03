#!/usr/bin/env python

import argparse
import matplotlib.pyplot as plt
import numpy as np
import pathlib


def create_plot(beta, output_file):
    x = np.linspace(-5.0, 5.0, 1001)
    y = np.tanh(beta*x)
    plt.plot(x, y)
    plt.ylim(-1.0, 1.0)
    plt.text(0.7, -0.7, f'beta = {beta:.2f}', fontsize=12, ha='center')
    plt.savefig(str(output_file).format(beta=beta))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--beta', type=float, required=True,
                        help='Value of beta')
    parser.add_argument('--output_dir', required=True,
                        help='Output directory for the plot')
    args = parser.parse_args()
    pathlib.Path(args.output_dir).mkdir(parents=True, exist_ok=True)
    output_file = pathlib.Path(args.output_dir) / 'plot_{beta:.3f}.png'
    create_plot(args.beta, output_file)
