#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=4
#SBATCH --time=00:05:00

mamba activate workflows_for_hpc

preprocess.py --nr_points=1000 --data_file points.txt
process.py --data_file points.txt --batch_size 100 \
    --nr_processes $SLURM_CPUS_PER_TASK \
    --output_file distances.txt
postprocesses.py --data_file distances.txt --nr_bins 20 \
    --output_file distribution.txt
