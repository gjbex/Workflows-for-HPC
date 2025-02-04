# Single column data

Although one can argue that a file that contains a single column is not a CSV
file, it is a vali use case.  Unfortunately, Python's CSV sniffer gets
confused, so some care has to be taken whenn using such files with atools.


## What is it?

1. `single_column_data.slurm`: Slurm script that uses a data file with a single
   column.
1. `data_single_column.csv`: data file with a single column.
