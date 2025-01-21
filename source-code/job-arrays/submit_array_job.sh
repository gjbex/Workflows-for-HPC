#!/usr/bin/env bash

# compute batch size from the number of batches
NR_BATCHES=4
export BATCH_SIZE=$(( $(ls input/*.dat | wc -l) / $NR_BATCHES ))

# submit an array job with the number of batches
sbatch --array=0-$(( $NR_BATCHES - 1 )) --environment=ALL process.slurm
