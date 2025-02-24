#!/usr/bin/env bash
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --time=00:02:00

module purge 2> /dev/null
module load atools

source <(aenv --data data_single_column.csv --no_sniffer)

echo "running on $(hostname)"
echo "file = $file"
