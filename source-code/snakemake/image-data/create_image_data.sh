#!/usr/bin/env bash
#
# Script to create an image file from a template image.  The script
# uses the template `template.tif` and takes two command line arguments:
#   - the first argument is the text to be added to the image
#   - the second argument is the name of the output image file

# Check the number of arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <text> <output_image>"
    exit 1
fi

magick convert -gravity north -pointsize 100 -annotate +0+220 "$1" template.tiff $2 2> /dev/null
