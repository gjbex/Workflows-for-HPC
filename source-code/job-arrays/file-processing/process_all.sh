#!/usr/bin/env bash

OUTPUT_DIR="output"

# create output directory if it does not exist
mkdir -p $OUTPUT_DIR

# process all input files
for input_file in input/*.dat
do
    file_nr=$(echo "$input_file" | grep -o '[0-9]\+')
    output_file="$OUTPUT_DIR/result_${file_nr}.txt"
    ./process.py --input_file "$input_file"  --output_file "$output_file"
done
