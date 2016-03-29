#!/bin/bash

# Input File
in_file="$1"

directory=$(dirname "$in_file")
in_basename=$(basename "$in_file")

name="${in_basename%%.*}"
in_ext="${in_basename#*.}"

# Output File
out="$directory/$name"

# Threshold
lib/localthresh -m 1 -r 65 -b 5 -n yes "$in_file" "$out.png"
lib/isonoise -r 3 "$out.png" "$out.png"

# Vectors
convert "$out.png" "$out.pnm"

potrace "$out.pnm" -b pdf -o "$out.pdf" --tight
potrace "$out.pnm" -b pdf -o "$out-i.pdf" --color '#FFFFFF' --tight

potrace "$out.pnm" --svg -o "$out.svg" --tight
potrace "$out.pnm" --svg -o "$out-i.svg" --color '#FFFFFF' --tight

rm "$out.pnm"

# PNGs
lib/color2alpha -ca white "$out.png" "$out.png"
convert "$out.png" -negate "$out-i.png"
