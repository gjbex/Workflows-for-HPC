#!/usr/bin/env bash

mkdir -p data/

for i in $(seq 100)
do
      ./data_generator.py --lines 100000 --words_per_line 45 > "data/file-${i}.txt"
done
