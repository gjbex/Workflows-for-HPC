#!/usr/bin/env -S bash -l
#SBATCH --account=lpt1_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --time=00:05:00

module purge 2> /dev/null
module load atools

source <(aenv --data data.csv)
alog --state start

OUT_FILE="out_${x}_${y}.txt"

echo $(( $x + $y )) > $OUT_FILE

alog  --state end  --exit $?
