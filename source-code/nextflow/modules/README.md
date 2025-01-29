# Modules

When running a Nextflow workflow on a cluster, it may be
convenient or even to use environment modules to manage
software dependencies.


## What is it?

1. `create_plot.py`: Python script that creates a plot of a
   function for a given parameter value and writes it to a
   given output directory.
1. `workflow.nf`: Nextflow workflow that uses the Python
   script to create a plot for a range of parameter values.
   It converts those plots from PNG to GIF format, and finally
   converts them into an animated GIF file.
1. `nextflow_slurm.config`: Nextflow configuration file that
   specifies the Slurm scheduler to use, and the required
   resources.  It also loads the rquired environment modules.
