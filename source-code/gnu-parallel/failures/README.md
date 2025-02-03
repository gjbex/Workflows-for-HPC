# Failures

GNU parallel lets you resume the computations that did not finish in a previous
run, as well as redo computations that failed (if you fixed the issue meanwhile).


## What is it?

1. `fail_or_not.py`: Python script that will terminate with exit status 1 if its `y`
   argument is zero (ZeroDivisionError).  However, by adding the `--fix` flags, the
   exception is caught, and the exit status is 0.
1. `run_fail.sh`: Bash script that uses GNU parallel to run the computation for a range
   of `x` and `y` values and that will fail for every combinaiton that has 0 for `y`.
   It writes a job log to `log.txt`.
1. `run_resume_failed.sh`: Bash script that uses GNU parallel to resume that failed
   computations of `run_fail.sh` based on the job log the latter generated.
