# Job arrays

Example of using job arrays to process many files in parallel.


## What is it?

1. `create_input_data.py`: Python script to create input data files for the job.
1. `process.py`: Python script to process the input data and produce an output
    file.
1. `process_all.sh`: Bash script to run the `process.py` script for all input
    files.
1. `process_batch.slurm`: Slurm script to run the `process.py` script for a batch
   of input files.
1. `submit_array_job.sh`: Bash script to submit the job array.
