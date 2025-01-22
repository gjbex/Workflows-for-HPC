# Task ID naming

To uniquely name output files, one can use the parameters for each individual
array job, but it can be simpler to simply use `SLURM_ARRAY_TASK_ID`.


## What is it?

1. `task_id_naming.slurm`: Slurm job script that names output files using
   `SLURM_ARRAY_TASK_ID`.
1. `data.csv`: data file to use.
