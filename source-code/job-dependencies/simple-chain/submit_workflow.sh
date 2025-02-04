#$!/usr/bin/env bash

set -e

# submit preprocessing job
PRE_ID=$(sbatch preprocess.slurm | grep -oP '\b\d+\b')
echo "preprocessing job: $PRE_ID"

# submit process job with dependency on preprocessing job
PROC_ID=$(sbatch --dependency=afterok:$PRE_ID process.slurm | grep -oP '\b\d+\b')
echo "processing job: $PROC_ID"

# submit postprocess job with dependency on process job
POST_ID=$(sbatch --dependency=afterok:$PROC_ID postprocess.slurm | grep -oP '\b\d+\b')
echo "postprocessing job: $POST_ID"
