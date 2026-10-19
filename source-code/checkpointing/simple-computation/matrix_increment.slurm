#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --time=00:03:00

# clean up all loaded modules
module purge 2> /dev/null

# parameters
CKPT_INTERVAL=60
NR_ROWS=2000
NR_COLS=2000
MAX_ITERS=1200
DMTCP_CHECKPOINT_DIR=dmtcp_checkpoints
MAX_JOB_SUBMISSIONS=10

# The initial job is number 1; each follow-up job receives the next number.
job_number_text=${1:-1}
if [[ ! $job_number_text =~ ^[1-9][0-9]*$ ]]
then
    echo "invalid job number: $job_number_text" >&2
    exit 2
fi
job_number=$job_number_text

if (( job_number > MAX_JOB_SUBMISSIONS ))
then
    echo "job number $job_number exceeds the limit of $MAX_JOB_SUBMISSIONS" >&2
    exit 2
fi

# create checkpoints directory if it doesn't exist
if ! mkdir -p "$DMTCP_CHECKPOINT_DIR"
then
    echo "failed to create checkpoint directory: $DMTCP_CHECKPOINT_DIR" >&2
    exit 1
fi

# Submit a bounded follow-up job.  Slurm cancels it automatically if this job
# succeeds because its afternotok dependency can then never be satisfied.
if (( job_number < MAX_JOB_SUBMISSIONS ))
then
    next_job_number=$((job_number + 1))
    if ! submission_output=$( \
        sbatch --parsable \
            --dependency="afternotok:$SLURM_JOB_ID" \
            --kill-on-invalid-dep=yes \
            matrix_increment.slurm "$next_job_number" \
    )
    then
        echo "failed to submit follow-up job" >&2
        exit 1
    fi
    follow_up_job_id=${submission_output%%;*}
    echo "Follow-up job $next_job_number/$MAX_JOB_SUBMISSIONS: $follow_up_job_id"
else
    echo "Final permitted job $job_number/$MAX_JOB_SUBMISSIONS; no follow-up submitted"
fi

# set environment for dmtcp
PATH="$HOME/dmtcp/bin:$PATH"
LD_LIBRARY_PATH="$HOME/dmtcp/lib:$LD_LIBRARY_PATH"

# if this is the first time the job runs, start computation, otherwise restart
if [[ ! -e "$DMTCP_CHECKPOINT_DIR/dmtcp_restart_script.sh" ]]
then  # only first job
    echo "launching"
    dmtcp_launch --interval "$CKPT_INTERVAL" --checkpoint-open-files \
        --ckptdir "$DMTCP_CHECKPOINT_DIR" \
        python matrix_increment.py --nr_rows "$NR_ROWS" --nr_cols "$NR_COLS" \
            --max_iters "$MAX_ITERS"
    computation_status=$?
else  # all follow-up jobs
    echo "restarting"
    "$DMTCP_CHECKPOINT_DIR/dmtcp_restart_script.sh"
    computation_status=$?
fi

# Preserve the computation's status for the afternotok dependency.
echo "DMTCP command exited with status $computation_status"
exit "$computation_status"
