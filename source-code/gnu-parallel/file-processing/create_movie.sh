#!/usr/bin/env bash

parallel --max-procs 4 --arg-file beta.txt \
    ./create_plot.py --output_dir images --beta {}
