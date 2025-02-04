#!/usr/bin/env bash

parallel --max-procs 2 --colsep ',' \
    python compute.py --x {1} --y {2} \
    :::: args.csv \
    > result_single_column.txt
