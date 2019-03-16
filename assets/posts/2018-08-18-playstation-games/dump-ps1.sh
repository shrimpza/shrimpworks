#!/bin/bash

GAMEFILE="$1/$1"

mkdir "$1"

cdrdao read-cd --read-raw --datafile "$GAMEFILE.bin" --device /dev/cdrom --driver generic-mmc-raw "$GAMEFILE.toc"
toc2cue "$GAMEFILE.toc" "$GAMEFILE.cue"
