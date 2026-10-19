#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=4
#SBATCH --mem 200M
#SBATCH --time=00:01:00

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

# Submit a bounded follow-up job.  Slurm cancels it automatically if this job
# succeeds because its afternotok dependency can then never be satisfied.
if (( job_number < MAX_JOB_SUBMISSIONS ))
then
    next_job_number=$((job_number + 1))
    if ! submission_output=$( \
        sbatch --parsable \
            --dependency="afternotok:$SLURM_JOB_ID" \
            --kill-on-invalid-dep=yes \
            openmp_chackpoint.slurm "$next_job_number" \
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

# on first job, start computation, otherwise restart from checkpoint
if [[ ! -e ./dmtcp_restart_script.sh ]]
then
    dmtcp_launch --interval 30 ./pi.exe 40000000000
    computation_status=$?
else
    ./dmtcp_restart_script.sh
    computation_status=$?
fi

# Preserve the computation's status for the afternotok dependency.
echo "DMTCP command exited with status $computation_status"
exit "$computation_status"
