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
1. `module_init.sh`: Bash script to be sourced in the `beforeScript` of the
   configuration file to set the required environment variables and function
   for using environment modules on an HPC cluster.
   **Note:** this script will only work on KU Leuven infrastructure.
1. `run_workflow.slurm`: Slurm job script that runs the workflow.

## Initializing modules

For a login shell, the environment gets initialized so the environment
modules can be used without issues.  However, this initialization is
not performed for job scripts submitted by Nextflow.  As the initialization
is not done in the user's `.bashrc`, a module initialization snippet
should be constructed.

Steps:

1. Purge all modules:
   ```bash
   $ module purge
   ```
1. Put the definition of the `module` command in a file:
   ```bash
   $ which module > module_init.sh
   ```
1. Add the environment variables related to the module system to that file:
   ```bash
   $ env | grep MODULE >> module_init.sh
   ```

