#!/usr/bin/env bash

set -e

# compute batch size from the number of batches
NR_BATCHES=4
NR_FILES=$(ls input/data_*.dat | wc -l)
export BATCH_SIZE=$(( $NR_FILES / $NR_BATCHES ))

# submit an array job with the number of batches
sbatch --array=0-$(( $NR_BATCHES - 1 )) \
       --export=ALL,BATCH_SIZE=$BATCH_SIZE \
       process_batch.slurm
