#!/bin/sh

in="$1"

threads=0

echo In: $1

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 1536k -threads $threads -s 854x480 $in.480p.mp4

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 768k -threads $threads -s 640x360 $in.360p.mp4

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 3072k -threads $threads -s 1280x720 $in.720p.mp4

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 6912k -threads $threads $in.1080p.mp4

