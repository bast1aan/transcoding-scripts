#!/bin/sh

in="$1"
out="$2"

threads=0

echo In: $1
echo Out: $2

ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -b:v 8736k -s 1280x720 -threads $threads $in.720p-vp9.webm

ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -b:v 3500k -s 854x480 -threads $threads $in.480p-vp9.webm

ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -b:v 2048k -s 640x360 -threads $threads $in.360p-vp9.webm
