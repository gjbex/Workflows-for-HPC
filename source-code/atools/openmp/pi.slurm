#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_syadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 -ntasks=1 --cpus-per-task=4
#SBATCH --time=00:15:00

module purge 2> /dev/null
module load atools

export OMP_NUM_THREADS=
source <(aenv --data data.csv)
alog --state start

OUT_FILE="out_${x}_${y}.txt"

./pi.exe $nr_points > pi_${nr_points}.txt

alog  --state end  --exit $?
