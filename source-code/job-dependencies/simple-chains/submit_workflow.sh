#$!/usr/bin/env bash

set -e

# submit preprocessing job
PRE_ID=$(sbatch preprocess.slurm | grep -oP '\d+')
echo "preprocessing job: $PRE_ID"

# submit process job with dependency on preprocessing job
PROC_ID=$(sbatch --dependency=afterok:$PRE_ID process.slurm | grep -oP '\d+')
echo "processing job: $PROC_ID"

# submit postprocess job with dependency on process job
POST_ID=$(sbatch --dependency=afterok:$PROC_ID postprocess.slurm | grep -oP '\d+')
echo "postprocessing job: $POST_ID"
