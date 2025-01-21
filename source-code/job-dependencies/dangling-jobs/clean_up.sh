#!/usr/bin/env bash

for job_id in $(squeue --cluster=all -t PD | grep DependencyNeverSatisfied | grep -oP '^\s+(\d+)\b')
do
    scancel --cluster=all $job_id
    echo job $job_id cancelled
done
