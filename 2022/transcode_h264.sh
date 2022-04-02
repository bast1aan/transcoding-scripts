#!/bin/sh

in="$1"
base="$2"

if [ -z "$base" ]; then
	base="$in"
fi


threads=0

echo In: $1

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 1536k -threads $threads -s 854x480 $base.480p.mp4

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 768k -threads $threads -s 640x360 $base.360p.mp4

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 3072k -threads $threads -s 1280x720 $base.720p.mp4

ffmpeg -i $in -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 6912k -threads $threads $base.1080p.mp4

