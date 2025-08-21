# Containers

Nextflow workflows can use containers to run tasks in isolated environments.
This is particularly useful for ensuring that the software dependencies are
consistent across different systems.


## What is it?

1. `workflow.nf`: nextflow workflow definition file.
1. `sum_group.py`: Python script that sums the values in a group.
1. `mean_group.py`: Python script that calculates the mean of values in a group.
1. `join_data.py`: Python script that joins the datasets.
1. `data`: directory containing the input data files.
1. `environment.yml`: Conda environment definition file that specifies the
   dependencies for the Python scripts.
1. `conda.recipe`: Apptainer recipe to build a container image with the
   necessary dependencies for the workflow.
1. `generate_data.py`: Python script that generates the input data files.


## How to use it?

To build the container, you need to have Apptainer installed. Then, run the
following command in the directory containing the `conda.recipe` file:

```bash
$ apptainer build 
      --fakeroot 
      --build-arg environment=conda_envinronment.yml \
      container.sif conda.recipe
```

To execute the workflow, you can use the following command:

```bash
$ nextflow -C nextflow.config run workflow.nf
```

Note that you need to adapt `nextflow.config` for your system.
