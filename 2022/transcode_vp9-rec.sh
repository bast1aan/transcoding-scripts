#!/bin/bash

# Recommended settings for VP9 from https://developers.google.com/media/vp9/settings/vod

run_480() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -crf 33 -threads $threads -s 854x480 $frame_rate $base.480p-vp9.webm
}

run_360() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -crf 36 -threads $threads -s 640x360 $frame_rate $base.360p-vp9.webm
}

run_720() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -crf 32 -threads $threads -s 1280x720 $frame_rate $base.720p-vp9.webm
}

run_1080() {
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -crf 31 -threads $threads -s 1920x1080 $frame_rate $base.1080p-vp9.webm
}

. ./base.sh
