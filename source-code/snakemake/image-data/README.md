# Image data

Workflow that contains a rule with wildcards in input and output.

## What is it?

1. `create_image_data.sh`: Bash script to generate a TIFF image.
1. `template.tiff`: template TIFF image.
1 `convert_tiff_to_numpy.py`: Python script to convert a TIFF image to a
  NumPy array.
1. `convert_tiff_tars_to_pytorch_tensor_dataset.py`: Python script to
   convert a directory of TARred images to a PyTorch tensor dataset.
1. `Snakefile`: Snakemake workflow to generate all the data.
