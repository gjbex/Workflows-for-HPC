#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --time=00:05:00

module purge 2> /dev/null
module load atools


source <(aenv --data data.csv)
alog --state start

echo "alpha = $alpha"
echo "beta = $beta"
echo "gamma = $gamma"

result=$(echo "$alpha + $beta + $gamma" | bc)
status=$?

# if the computation succeeded, write output
if [[ $status ]]
then
    echo "$alpha,$beta,$gamma,$result" > "out-${SLURM_ARRAY_TASK_ID}.txt"
    status=$?
fi

alog  --state end  --exit $status
