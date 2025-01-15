Running a job on an HPC system is typically not that hard, but executing a
non-trivial workflow that involves both data movement and various computations
is not so trivial.  In this training you will get an overview of tools that can
help you to efficiently and conveniently run workflows on supercomputers.


## Learning outcomes

When you complete this training you will

* be able to schedule tasks that run on a login node at given time(s);
* be able to run SLURM jobs at given time(s);
* know how to break down a computation that consists of multiple tasks that
  require specific resources into a set of SLURM jobs using job dependencies;
* understand how to use job dependencies to restart jobs that checkpoint their
  state;
* understand how to SLURM job arrays to run multiple jobs with similar resource
  requirements;
* be able to use either worker-ng or atools to simplify managging such parallel
  workflows;
* use a workflow manager to run a workflow that consists of multiple tasks that
  require specific resources.


## Schedule

## Training materials

Slides are available in the [GitHub
repository](https://github.com/gjbex/Workflows-for-HPC), as well as example
code and hands-on material.


## Target audience

Anyone who wants to run non-trivial workflows on HPC systems.


## Prerequisites

You should be familiar with the basics of running jobs on an HPC system and
know your way around the command line.  You should also be familiar with the
basics of the SLURM job scheduler.


## Trainer(s)

* Geert Jan Bex [geertjan.bex@uhasselt.be](mailto:geertjan.bex@uhasselt.be)
