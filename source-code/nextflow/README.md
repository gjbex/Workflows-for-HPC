# NextFlow

NextFlow is a workflow system that is mainly popular among bioinformaticians
but that can be applied to any domain. It is designed to be portable,
reproducible, and scalable.  It can run processes of a workflow as Slurm
jobs.


## What is it?

1. `simple-chain`: simple example of a workflow with three processes,
    each processing the output of the previous one.  One process also
    requires a conda environment.
1. `simple-chain-slurm`: simple example of a workflow with three processes,
    each processing the output of the previous one.  One process also
    requires a conda environment, and the workflow is run as Slurm jobs.
    Note that due to how jobs are submitted, the conda environment is
    build in a workflow process, rather than as part of the process that
    requires it.
1. `file-processing`: example of a workflow that processes a number of files.
1. `modules`: example of a workflow that uses environment modules when running
   on a cluster.
1. `containers`: example of a workflow that uses containers when running.
