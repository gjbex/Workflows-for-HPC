# Job arrays

Example of using job arrays to process many files in parallel.


## What is it?

1. `create_input_data.py`: Python script to create input data files for the job.
1. `process.py`: Python script to process the input data and produce an output
    file.
1. `workflow.nf`: Nextflow script that defines the workflow.
1. `nextflow_slurm.config`: Nextflow configuration file that specifies the
    resources to use on a cluster managed by Slurm.
