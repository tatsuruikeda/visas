#!/bin/bash

function animate_progress {
  local pid=$1
  local delay=0.75
  local spinstr='^>v<'
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c] " "$spinstr"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
}

get_labels.sh | get_variants.sh > text.txt &
animate_progress $!

Rscript /usr/local/cmd/get_circles_sorted.r text.txt out 2> output.log &
animate_progress $!

trimming_sorted.sh

rm output.log text.txt
