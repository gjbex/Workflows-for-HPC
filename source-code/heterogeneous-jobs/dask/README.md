# Dask

To run a Dask cluster manually, you have to

* start a Dask scheduler,
* start one or more Dask workers, and
* connect a Dask client to the scheduler.

The Dask scheduler requires less resources than the Dask workers, so a
heterogeneous job is a nice option to specify the resources for the scheduler
and the workers separately, and start each using `srun`.


## What is it?

1. `dask_distr_test.py`: Python script that uses a Dask client simply for
   illustration purposes.
1. `dask_distr_test.slurm`: Slurm script to run the Dask scheduler and workers
   on a heterogeneous job.
1. `environment.yml`: Conda environment file to create the environment for the
   Dask scheduler and workers.
