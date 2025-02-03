# Job dependencies

Various examples of defining workflows with Slurm job dependencies.


## What is it?

1. `simple-chain`: example of a simple chain of a preprocessing job followed,
   by a processing job and a postprocessing job.
1. `dangling-jobs`: example of a workflow based on job dependencies with a
   dangling job, i.e., a dependency that is not satisfied.k
1. `max-restarts`: example of using job dependencies and environment variables
   to restart a job at most a given number of times.
