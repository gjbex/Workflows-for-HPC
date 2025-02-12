# Heterogeneous jobs

Schedulers such as Slurm support heterogeneous jobs, where different tasks in
the same job can be assigned to different nodes with different resources. This
is useful for running tasks that have different resource requirements, or for
running tasks that need to be run on different types of nodes.


## What is it?

1. `dask`: a Dask job that starts a Dask scheduler and several Dask workers and
   runs a Dask job on them.
