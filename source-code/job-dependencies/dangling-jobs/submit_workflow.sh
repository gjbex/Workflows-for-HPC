#!/usr/bin/env bash

JOB1_ID=$(sbatch job1.slurm | grep -oP '\b\d+\b')

# job to run after job1 ends successfully
sbatch --dependency=afterok:$JOB1_ID job2.slurm

# job to run after job1 fails
sbacth --dependency=afternotok:$JOB1_ID job3.slurm
