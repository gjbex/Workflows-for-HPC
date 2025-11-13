#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --ntasks=4
#SBATCH --time=00:10:00

start_value=$SLURM_ARRAY_TASK_ID
end_value=$(( SLURM_ARRAY_TASK_ID + SLURM_ARRAY_TASK_STEP ))

parallel --max-procs $SLURM_NTASKS ./counter.py data/file-{}.txt processed-data/file-{}.bin ::: $(seq $start_value $end_value)
