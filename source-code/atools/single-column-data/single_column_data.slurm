#!/usr/bin/env bash
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice --partition=batch_icelake
#SBATCH --nodes=1 -ntasks=1 --cpus-per-task=18
#SBATCH --time=00:02:00

# Note: this task doesn't require 18 CPUs per task, this only illustrates
# that tasks can use multiple cores or even nodes if required.

module purge
module load atools

source <(aenv --data data_single_column.csv --no_sniffer)

echo "running on $(hostname)"
echo "file = $file"
