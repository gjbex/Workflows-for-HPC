#!/usr/bin/env bash

MAX_BETA=50
BETA_FILE=beta.txt
IMG_DIR=images/
DELAY=20
LOOP=0

# create file containing the values of beta
rm -f $BETA_FILE
for i in $(seq -w 0 $MAX_BETA)
do
    echo ${i:0:1}.${i:1} >> $BETA_FILE
done

# generate a plot of each value of beta
mkdir -p $IMG_DIR
parallel --max-procs 4 --arg-file $BETA_FILE \
    ./create_plot.py --output_dir $IMG_DIR --beta {}

# convert each file from PNG to GIF
ls $IMG_DIR/*.png | parallel --max-procs 4 \
    convert {} {.}.gif
 
# convert GIF files to animated GIF
convert -delay $DELAY -loop $LOOP $IMG_DIR/*.gif movie.gif
