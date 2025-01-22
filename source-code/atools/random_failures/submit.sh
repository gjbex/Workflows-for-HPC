#!/bin/bash

module load atools

array_ids=$(arange --data data.csv)
sbatch --array${array_ids} test.pbs
