#!/usr/bin/env -S bash -l
#SBATCH --account=lpt2_sysadmin
#SBATCH --cluster=wice
#SBATCH --time=00:10:00
#SBATCH --ntasks=1 --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH hetgroup
#SBATCH --ntasks=4 --cpus-per-task=8

scheduler_node=$(hostname)
scheduler_port=8786

source ~/.mamba_init.sh
mamba activate dask_heterogeneous_job

# launch dask server process
echo "launching dask-server"
srun --exclusive \
    --ntasks=$SLURM_NTASKS_HET_GROUP_0 \
    --cpus-per-task=$SLURM_CPUS_PER_TASK_HET_GROUP_0 \
    --mem=$SLURM_MEM_PER_NODE_PACK_GROUP_0 \
    dask-scheduler

# give server time to start
sleep 5

# launch dask worker processes
for i in $(seq $SLURM_NTASKS_HET_GROUP_1)
do
    echo "launching dask-worker $i"
    srun --exclusive \
        --ntasks=1 \
        --cpus_per_task=$SLURM_CPUS_PER_TASK_HET_GROUP_1 \
        --mem=$SLURM_MEM_PER_NODE_PACK_GROUP_1 \
    dask-worker $scheduler_node
done

# give workers time to start
sleep 5

python dask_distr_test.py \
    --scheduler ${scheduler_node} \
    --scheduler_port ${scheduler_port} \
    --verbose
