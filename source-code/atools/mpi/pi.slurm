#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_syadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 -ntasks= --cpus-per-task=4
#SBATCH --time=00:15:00

module purge 2> /dev/null
module load atools

export OMP_NUM_THREADS=
source <(aenv --data data.csv)
alog --state start

OUT_FILE="out_${x}_${y}.txt"

mpirun -np $SLURM_CPUS_PER_TASK ./pi.exe $nr_points > pi_${nr_points}.txt

alog  --state end  --exit $?
