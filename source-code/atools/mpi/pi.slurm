#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --ntasks-per-node=4
#SBATCH --time=00:15:00

module purge 2> /dev/null
module load atools
module load foss

export OMP_NUM_THREADS=
source <(aenv --data data.csv --no_sniffer)
alog --state start

OUT_FILE="out_${x}_${y}.txt"

mpirun -np $SLURM_NTASKS_PER_NODE ./pi.exe $nr_points > pi_${nr_points}.txt

alog  --state end  --exit $?
