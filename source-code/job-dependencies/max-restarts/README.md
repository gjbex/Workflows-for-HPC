# Maximum restarrs

An example of a Slurm jobscript that will restart at most a given
number of times.  This can be important to avoid infinite loops 
when restarting jobs.


## What is it?

1. `jobscript.slurm`: Slurm job script that restarts at most
   a given maximum number of times.
