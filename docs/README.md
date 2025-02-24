Running a job on an HPC system is typically not that hard, but executing a
non-trivial workflow that involves both data movement and various computations
is not so trivial.  In this training you will get an overview of tools that can
help you to efficiently and conveniently run workflows on supercomputers.


## Learning outcomes

When you complete this training you will

* be able to schedule tasks that run on a login node at given time(s);
* be able to run Slurm jobs at given time(s);
* know how to break down a computation that consists of multiple tasks that
  require specific resources into a set of Slurm jobs using job dependencies;
* understand how to use job dependencies to restart jobs that checkpoint their
  state;
* understand how to Slurm job arrays to run multiple jobs with similar resource
  requirements;
* be able to use either worker-ng or atools to simplify managing such parallel
  workflows;
* use a workflow manager such as Nextflow to run a workflow that consists of
  multiple tasks that require specific resources.


## Schedule

Total duration: 3 hours

| Subject                             | Duration |
|-------------------------------------|----------|
| Introduction and motivation         |  5 min   |
| Scheduling tasks on a login node    | 10 min   |
| Scheduling tasks with Slurm         | 10 min   |
| Slurm job dependencies              | 15 min   |
| Checkpointing and restarting jobs   | 15 min   |
| Slurm job arrays                    | 20 min   |
| atools                              | 20 min   |
| Nextflow workflows                  | 40 min   |
| Wrap-up                             |  5 min   |


## Training materials

Slides are available in the [GitHub
repository](https://github.com/gjbex/Workflows-for-HPC), as well as example
code and hands-on material.


## Target audience

Anyone who wants to run non-trivial workflows on HPC systems.


## Prerequisites

You should be familiar with the basics of running jobs on an HPC system and
know your way around the command line.  You should also be familiar with the
basics of the Slurm job scheduler.


## Trainer(s)

* Geert Jan Bex [geertjan.bex@uhasselt.be](mailto:geertjan.bex@uhasselt.be)
