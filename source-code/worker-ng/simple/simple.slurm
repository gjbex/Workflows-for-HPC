#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=2 --cpus-per-task=1
#SBATCH --time=00:05:00

OUT_FILE="out_${x}_${y}.txt"

echo $(( $x + $y )) > $OUT_FILE
