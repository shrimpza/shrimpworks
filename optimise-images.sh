#!/bin/bash

if [ -z "$1" ]; then
  echo "Path argument is expected"
  exit 1;
fi

find $1 -name "*.jpg" | xargs -n 1 jpegoptim -s -p -P -m85

find $1 -name "*.png" | xargs -n 1 pngcrush -brute -reduce -oldtimestamp -ow
