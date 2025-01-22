#!/usr/bin/env -S bash -l
#SBATCH --account lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --time=00:05:00

# log start of work item execution
alog --state start

# define work item parameters
source <(aenv --data data.csv)

# do actual work, i.e., original PBS script
echo "alpha = $alpha"
echo "beta = $beta"
echo "gamma = $gamma"
exit_code=$(( $RANDOM % 2 ))

result=$(echo "$alpha + $beta + $gamma" | bc -l)
echo "$alpha,$beta,$gamma,$result" > "out-${SLURM_ARRAY_TASK_ID}.txt"

# log end of work item execution
alog --state end --exit "$exit_code"
