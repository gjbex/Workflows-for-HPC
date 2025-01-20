$!/usr/bin/env bash

# define function to extract job ID from sbatch output
function extract_job_id
{
    echo $1 | grep -oP '\d+'
}

# submit preprocessing job
PREPROCESS_ID=extract_job_id $(sbatch preprocess.slurm)

# submit process job with dependency on preprocessing job
PROCESS_ID=extract_job_id $(sbatch --dependency=afterok:$PREPROCESS_ID process.slurm)

# submit postprocess job with dependency on process job
POSTPROCESS_ID=extract_job_id $(sbatch --dependency=afterok:$PROCESS_ID postprocess.slurm)
