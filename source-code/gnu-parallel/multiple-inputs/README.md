# Multiple inputs

GNU parallel can use multiple input sources.


## What is it?

1. `compute.py`: Python script that computes the product of two arguments.
1. `arg1.txt`: values for the first operand.
1. `arg2.txt`: values for the second operand.
1. `compute.sh`: compute the product of the corresponding values in `arg1.txt`
   and `arg2.txt`.
1. `compute_crossproduct.sh`: compute the product of all pairs of values in
   `arg1.txt` and `arg2.txt`.
1. `args.csv`: CSV file with all pairs of values in `arg1.txt` and
   `arg2.txt` as columns.
1. `compute_single_file.sh`: compute the product of all pairs of values in
   a CSV files with two columns.
1. `compute_header.sh`: compute the product of all paris of values in a
   CSV file with column names.
