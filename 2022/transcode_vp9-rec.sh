#!/bin/bash

# Recommended settings for VP9 from https://developers.google.com/media/vp9/settings/vod

_threads() {
	# vp9 needs > 0 threads
	if [ "$threads" -le 1 ]; then
		threads="4"
	fi
}

run_480() {
	_threads
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 33 -threads $threads -row-mt 1 -s 854x480 $frame_rate $base.480p-vp9.webm
}

run_360() {
	_threads
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 36 -threads $threads -row-mt 1 -s 640x360 $frame_rate $base.360p-vp9.webm
}

run_720() {
	_threads
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 32 -threads $threads -row-mt 1 -s 1280x720 $frame_rate $base.720p-vp9.webm
}

run_1080() {
	_threads
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 31 -threads $threads -row-mt 1 -s 1920x1080 $frame_rate $base.1080p-vp9.webm
}

. ./base.sh
