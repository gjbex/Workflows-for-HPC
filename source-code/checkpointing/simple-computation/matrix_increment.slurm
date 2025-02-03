#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time 00:03:30

# clean up all loaded modules
module purge 2> /dev/null

# parameters
CKPT_INTERVAL=60
NR_ROWS=2000
NR_COLS=2000
MAX_ITERS=1200
DMTCP_CHECKPOINT_DIR=dmtcp_checkpoints

# create checkpoints directory if it doesn't exist
mkdir -p $DMTCP_CHECKPOINT_DIR

# submit a follow-up job that will only run if this didn't finish with exit status 0
follow_up_job_id=$(sbatch --dependency=afternotok:$SLURM_JOB_ID matrix_increment.slurm | grep -oP '\b\d+\b')
echo "Follow-up job ID: $follow_up_job_id"

# set environment for dmtcp
PATH="$HOME/dmtcp/bin:$PATH"
LD_LIBRARY_PATH="$HOME/dmtcp/lib:$LD_LIBRARY_PATH"

# if this is the first time the job runs, start computation, else restart
if [[ -e dmtcp_restart_script.sh ]]
then
    echo "restarting"
    ./dmtcp_restart_script.sh
else
    echo "launching"
    dmtcp_launch --interval $CKPT_INTERVAL  --checkpoint-open-files \
        python matrix_increment.py --nr_rows $NR_ROWS --nr_cols $NR_COLS \
            --max_iters $MAX_ITERS
fi

# cancel follow-up job as either computation or restart finished
echo "computation done, cancelling follow-up job $follow_up_job_id"
scancel --cluster=$SLURM_CLUSTER_NAME $follow_up_job_id
