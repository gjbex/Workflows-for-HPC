#!/usr/bin/env bash

parallel --max-procs 2 \
    python compute.py --x {1} --y {2} \
    :::: arg1.txt \
    :::: arg2.txt \
    > result_cross_product.txt
