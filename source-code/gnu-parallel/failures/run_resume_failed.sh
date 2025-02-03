#!/usr/bin/env bash

parallel --max-procs 2 --joblog log.txt --resume-failed \
    ./fail_or_not.py {1} {2} --fix \
    ::: $(seq 0 3) ::: $(seq 0 3)

