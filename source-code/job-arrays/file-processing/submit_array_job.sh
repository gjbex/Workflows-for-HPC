#!/usr/bin/env bash

set -e

# compute batch size from the number of batches
NR_BATCHES=4
NR_FILES=$(ls input/data_*.dat | wc -l)
BATCH_SIZE=$(( $NR_FILES / $NR_BATCHES ))

# submit an array job with the number of batches
sbatch --array=1-$NR_FILES:$BATCH_SIZE process_batch.slurm
