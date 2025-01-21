# Dangling jobs

This is an example of a workflow based on job dependencies with a dangling job,
i.e., a dependency that is not satisfied.


## What is it?

1. `job1.slurm`: job script that will run successfully.
1. `job2.slurm`: job script that will run when job1 is successful.
1. `job3.slurm`: job script that will run when job1 fails.
1. `submit_workflow.sh`: Bash script to submit the jobs to the Slurm scheduler,
   setting up the dependencies.
