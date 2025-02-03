# Simple computation

This is an example of a simple computation that exceeds the maximum walltime.
DMTCP checkpointing is used to restart the job.  This is implemented via Slurm
job dependencies.


## What is it?

1. `matrix_increment.py`: Python script that performs a simple computation
   using a single thread.  It writes output to a file that is kept open during
   the whole execution.
1. `matrix_increment.slurm`: Slurm job script that launches or restarts the
   computation.
