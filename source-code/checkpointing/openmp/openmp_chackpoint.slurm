#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=4
#SBATCH --mem 200M
#SBATCH --time=00:01:00

# schedule follow-up job
follow_up_job_id=$( \
    sbatch --depency=afternotok:$SLURM_JOB_ID openmp_checkpoint.slurm \
        | grep -oP '\b\d+\b' \
)

# on first job, start computation, otherwise restart from checkpoint
if [[ ! -e ./dmtcp_restart_script.sh ]]
then
    dmtcp_launch --interval 30 ./pi.exe 40000000000
else
    ./dmtcp_restart_script.sh
fi

# last job cancels follow-up job
scancel --cluster=$SLURM_CLUSTER_NAME $follow_up_job_id
