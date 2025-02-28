#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --mem=200M
#SBATCH --time=00:01:30

# maximum number of runs
MAX_RESTARTS=3

# if this is the first run, initialize RESTARTS_LEFT, else decrement
if [[ ! -n "$RESTARTS_LEFT" ]]
then
    RESTARTS_LEFT=$MAX_RESTARTS
    rm -f ourput.txt
else
    RESTARTS_LEFT=$(( $RESTARTS_LEFT - 1 ))
fi

# schedule follow-up job with one restart less
follow_up_job_id=$( \
    sbatch --export=ALL,RESTARTS_LEFT=$RESTARTS_LEFT  \
        --dependency=afternotok:$SLURM_JOB_ID jobscript.slurm \
        | grep -oP '\b\d+\b' \
)
echo "follow-up job scheduled: $follow_up_job_id, $(( $RESTARTS_LEFT + 1 )) restarts left"

echo "number restarts left: $RESTARTS_LEFT" >> output.txt

if [[ $RESTARTS_LEFT -gt 0 ]]
then
    exit 1
fi 

scancel --cluster=$SLURM_CLUSTER_NAME $follow_up_job_id
