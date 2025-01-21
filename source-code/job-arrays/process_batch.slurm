#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --time=00:05:00

set -e

INPUT_DIR="input"
OUTPUT_DIR="output"
DEFAULT_BATCH_SIZE=50

# create output directory if it does not exist
mkdir -p $OUTPUT_DIR

# if BATCH_SIZE is not defined and set to a value, set it to DEFAULT_BATCH_SIZE
if [[ ! -n "$BATCH_SIZE" ]]
then
    echo "set BATCH_SIZE"
    BATCH_SIZE=$DEFAULT_BATCH_SIZE
fi

# set batch start value, i.e., one less than the file number to start with
BATCH_START=$(( $SLURM_ARRAY_JOB_ID * $BATCH_SIZE ))

# process all input files
for i in $(seq $BATCH_SIZE)
do
    file_nr=$(printf "%03d" $(( $BATCH_START + $i )))
    input_file="$INPUT_DIR/data_${file_nr}.dat"
    output_file="$OUTPUT_DIR/result_${file_nr}.txt"
    ./process.py --input_file "$input_file"  --output_file "$output_file"
done
