#!/bin/bash

run_480() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 854x480 $frame_rate $base.480p-vp9.webm
}

run_360() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 640x360 $frame_rate $base.360p-vp9.webm
}

run_720() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 1280x720 $frame_rate $base.720p-vp9.webm
}

run_1080() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 1920x1080 $frame_rate $base.1080p-vp9.webm
}

. ./base.sh
