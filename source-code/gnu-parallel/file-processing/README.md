# File processing

Example of a workflow that uses GNU parallel to execute tasks in parallel.  It
creates plots for parameter values, converts them from PNG to GIF and creates
an animated GIF out of those files.


## What is it?

1. `create_plot.py`: Python script to create a plot (PNG format) in the
   specified directory based on a parameter value for beta.
1. `create_movie.sh`: Bash script that executes the workflow using
   GNU parallel for task parallelism.
