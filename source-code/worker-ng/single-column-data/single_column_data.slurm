#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --time=00:05:00
#SBATCH --ntasks=2

echo "$WORKER_CLIENT_ID: $value"
