#!/bin/bash

run_480() {
	ffmpeg -i $in -acodec copy -vcodec libx264 -preset slower -crf 25 -threads $threads -s 854x480 $frame_rate $base.480p.mp4
}

run_360() {
	ffmpeg -i $in -acodec copy -vcodec libx264 -preset slower -crf 25 -threads $threads -s 640x360 $frame_rate $base.360p.mp4
}

run_720() {
	ffmpeg -i $in -acodec copy -vcodec libx264 -preset slower -crf 25 -threads $threads -s 1280x720 $frame_rate $base.720p.mp4
}

run_1080() {
	ffmpeg -i $in -acodec copy -vcodec libx264 -preset slower -crf 25 -threads $threads -s 1920x1080 $frame_rate $base.1080p.mp4
}

. ./base.sh
