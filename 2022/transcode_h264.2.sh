#!/bin/sh

in="$1"

threads=0

echo In: $1

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -crf 24 -threads $threads -s 1280x720 $in.720p-crf24.mp4


