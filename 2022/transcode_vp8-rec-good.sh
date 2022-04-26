#!/bin/bash

_threads() {
	# vp8 needs > 0 threads
	if [ "$threads" -le 1 ]; then
		threads="4"
	fi
}

run_480() {
	_threads
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 33 -threads $threads -s 854x480 $frame_rate $base.480p-vp8.webm
}

run_360() {
	_threads
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 36 -threads $threads -s 640x360 $frame_rate $base.360p-vp8.webm
}

run_720() {
	_threads
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 32 -threads $threads -s 1280x720 $frame_rate $base.720p-vp8.webm
}

run_1080() {
	_threads
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 31 -threads $threads -s 1920x1080 $frame_rate $base.1080p-vp8.webm
}

. ./base.sh
