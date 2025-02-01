#!/usr/bin/env bash

parallel --max-procs 2 --joblog log.txt \
    ./fail_or_not.py {1} {2} \
    ::: $(seq 0 3) ::: $(seq 0 3)
