#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --time=00:05:00

mamba activate workflows_for_hpc

postprocess.py --distances_file distances.txt --nr_bins 20 \
    --distribution_file distribution.txt
