# Reductor

Illustration of a non-trivial reductor.  A text file is parsed by line, and a
dictionary of words and their counts is produced.  When done in parallel, each
work item will produce its own dictionary that is saved as a pickle file.  The
reductor will aggregate the data into a single pickle file.


## What is it?

1. `data_generator.py`: generate a simple text file suitable for parsing and
   word count.  The file can be arbitrary large.
1. `generate_data.sh`: Bash script that generates data files in a directory `data/`.
1. `counter.py`: reads a text file from a specified line up to and not
   including a specified last line (0-based, same semantics as Python's `range`
   function.  The result is a pickle file representing the `dict` for this text
   fragment.
1. `counter.slurm`: Slurm job script to run `counter.py` using GNU parallel;
   illustrates multi-level parallelism when submitted as a job array.
1. `pickle_empty.py`: create a pickle file for an empty `dict`.  Note that this
    script ignores all but the first positional argument, which is the output
    pickle file name.
1. `pickle_update.py`: takes two tickle files as arguments, and add the
   contents of the second to the first.
1. `pickle_diff.py`: compare two pickle files, and print differences.


## How to use?

To create a text file with 100 lines, 20 words per line:
```bash
$ ./data_generator.py --lines 100 --words_per_line 20 > text.txt
```

To count words in the text fragment from, e.g., line 0 to line 10
(non-inclusive), and produce a pickle file `count_01.bin`:
```bash
$ ./counter.py text.txt --start 0 --end 10 count_01.bin
```
To count words in the text fragment for the next 10 lines, and produce
a pickle file `count_02.bin`:
```bash
$ ./counter.py text.txt --start 10 --end 20 count_02.bin
```

To combine the pickle files, first create one containing an empty `dict`:
```bash
$ ./pickle_empty count_aggr.bin
```
Next, aggragate all the pickle files into `count_aggr.bin`:
```bash
for file in $(ls count_[0-9]*.bin)
do
    ./pickle_update.py count_aggr.bin $file
done
g``
