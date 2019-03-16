#!/bin/bash

GAMEFILE="$1/$1"

mkdir "$1"

BLK_SIZE=$(isoinfo -d -i /dev/cdrom | grep -i -E 'block size' | sed 's/[^0-9]*//')
VOL_SIZE=$(isoinfo -d -i /dev/cdrom | grep -i -E 'volume size' | sed 's/[^0-9]*//')

dd if=/dev/cdrom of="$GAMEFILE.iso" bs=$BLK_SIZE count=$VOL_SIZE
