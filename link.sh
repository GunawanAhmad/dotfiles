#!/bin/bash

# Get the directory in which this script lives.
script_dir=$(dirname "$(readlink -f "$0")")
echo "$script_dir"
# Get a list of all files in this directory that start with a dot.
files=$(find -maxdepth 1 -name '.*' -not -path './.git' -not -path '.' -not -path '..')

echo "Looping through all dotfiles in $script_dir:"
for file in $files
do
    basename=$(basename $file)
    echo "Creating symlink for $basename to home directory"
    rm -rf ~/$basename
    ln -s $script_dir/$basename ~/$basename
done

