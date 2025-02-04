#!/usr/bin/env bash

parallel --max-procs 2 --colsep ',' --header ',' \
    python compute.py --x {x} --y {y} \
    :::: args_with_header.csv \
    > result_header.txt
