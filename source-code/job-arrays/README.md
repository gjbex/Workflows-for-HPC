# Job arrays

Slurm supports job arrays which are a way to submit multiple jobs with a single
submission script. This is useful when you have a large number of similar jobs
to run. The jobs in the array can be run in parallel or sequentially. The jobs
in the array are distinguished by the job ID and the array ID. The job ID is
the job ID of the first job in the array and the array ID is the index of the
job in the array. The array ID is passed to each individual job as an
environment variable (`SLURM_ARRAY_TASK_ID`).


## What is it?

1. `file-processing`: example of using job arrays to process many files in
   parallel.
