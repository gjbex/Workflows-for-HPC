# OpenMP

DMTCP can be used to checkpoint and restart OpenMP programs.


## What is it?

1. `pi.c`: compute pi using a Monte Carlo method, uses OpenMP for parallel
   execution.
1. `Makefile`: make file to build the application.
1. `openmp_chackpoint.slurm`: SLURM script to run the application on a
   compute node, checkpoint and restart as long as necessary.
