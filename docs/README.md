Running a job on an HPC system is typically not that hard, but executing a
non-trivial workflow that involves both data movement and various computations
is not so trivial. In this training you will get an overview of tools that can
help you to efficiently and conveniently run workflows on supercomputers.


## Learning outcomes

When you complete this training you will

* be able to schedule tasks that run on a login node at given time(s);
* be able to run Slurm jobs at given time(s);
* know how to break down a computation that consists of multiple tasks that
  require specific resources into a set of Slurm jobs using job dependencies;
* understand how to use job dependencies to restart jobs that checkpoint their
  state;
* understand how to use Slurm job arrays to run multiple jobs with similar resource
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
know your way around the command line. You should also be familiar with the
basics of the Slurm job scheduler.

More concretely, participants should already be comfortable with the following:

* logging in to an HPC system and working from the shell;
* navigating directories, creating files, editing small scripts, and running
  commands;
* transferring or organizing input and output files for batch jobs;
* submitting a basic Slurm job with `sbatch`;
* monitoring jobs and interpreting basic job states and output files;
* understanding core Slurm concepts such as wall time, CPUs, memory,
  partition, and account;
* reading and making small changes to short Bash scripts.

Familiarity with simple Python scripts is helpful, but not strictly required.
You do not need prior experience with Slurm job dependencies, job arrays,
checkpoint/restart workflows, `atools`, `worker-ng`, Nextflow, or Snakemake.
Those are part of the training itself.

### Quick self-assessment

If you can do most of the tasks below without looking up basic shell or Slurm
syntax, you are likely ready for this training.

* log in to an HPC cluster and move to the directory where your job files are
  stored;
* submit a batch job and check whether it is queued, running, or finished;
* read a short Slurm job script and identify the requested time, CPUs, and
  memory;
* make a small change to a Bash script and run it again;
* understand that one job can produce files that a later job needs as input;
* locate the output or error file of a completed job;
* rerun a failed job after fixing a simple mistake in the script or input.

If several of these items still feel difficult, the training will probably move
too fast. In that case, it is better to first take a short introduction to
Linux command-line use and basic Slurm job submission.

For following along hands-on, you need
* laptop or desktop with internet access and set up so you can connect to an
  HPC system;
* an account on an HPC system (e.g., VSC, CECI, ...);
* compute credits if that is required to run jobs on the HPC system;


## Level of the Material

For participants who already have basic HPC and Slurm experience, the material
in this training is approximately

* Introductory: 25 %
* Intermediate: 50 %
* Advanced: 25 %

These percentages describe the level of the workflow-management topics covered
in the training, not the required entry level in shell usage or HPC job
submission.


## Trainer(s)

* Geert Jan Bex [geertjan.bex@uhasselt.be](mailto:geertjan.bex@uhasselt.be)
