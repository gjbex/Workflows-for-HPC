#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --time=00:05:00

set -e

INPUT_DIR="input"
OUTPUT_DIR="output"

# create output directory if it does not exist
mkdir -p $OUTPUT_DIR

# process all input files
for id in $(seq $SLURM_ARRAY_TASK_ID $(( $SLURM_ARRAY_TASK_ID + $SLURM_ARRAY_TASK_STEP - 1 )))
do
    file_nr=$(printf "%03d" $id)
    input_file="$INPUT_DIR/data_${file_nr}.dat"
    output_file="$OUTPUT_DIR/result_${file_nr}.txt"
    ./process.py --input_file "$input_file"  --output_file "$output_file"
done
