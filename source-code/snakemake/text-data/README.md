# Text data

This workflow generates the following artifacts:

- a number of ASCII text files
- a file that lists the nanes of these text files;
- a CSV file that contains labels for each of the text files;
- a ZIP file containing all the text files;
- a TAR file containing all the text files;
- a Hugging Face dataset that contains all the text files, labeled with
  the data in the labels file.


## What is it?

1. `create_text_data.py`: Python script to create the text files.
1. `create_labels.py`: Python script to create the labels for the text file.
1. `concat_txt_to_dataset.py`: Python script to concatenate text files into a Hugging
   Face dataset, including labels.
1. `Snakefile`: Snakemake file to generate the data set.
1. `config_medium.yml`: configuration file to produce a "medium" sized dataset.
1. `config_small.yml`: configuration file to produce a small dataset.

### Running the workflow

To run the workflow:
```bash
$ snakemake
```
This will create a directory `data` that contains all the artifaccts.

To run with a configuration file, e.g.,
```bash
$ snakemake  --configfile config_small.yml
```

To run with a runtime parameter:
```bash
$ snakemake  --config nr_file=20
```
