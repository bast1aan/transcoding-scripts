#!/bin/bash

_make_logdir() {
	ffmpeglogdir=`mktemp -d /tmp/ffmpeg2pass.XXXXXXXXXX`
}

_clean_logdir() {
	rm $ffmpeglogdir/*
	rmdir $ffmpeglogdir
}

run_480() {
	_make_logdir
	ffmpeg -i $in -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 854x480 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null 
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 854x480 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log" $base.480p-vp9.webm
	_clean_logdir
}

run_360() {
	_make_logdir
	ffmpeg -i $in -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 640x360 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 640x360 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log"  $base.360p-vp9.webm
	_clean_logdir
}

run_720() {
	_make_logdir
	ffmpeg -i $in -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 1280x720 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 1280x720 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log"  $base.720p-vp9.webm
	_clean_logdir
}

run_1080() {
	_make_logdir
	ffmpeg -i $in -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 1920x1080 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null
	ffmpeg -i $in -acodec libopus -ac 2 -b:a 96k -vcodec libvpx-vp9 -b:v 0 -crf 40 -threads $threads -row-mt 1 -s 1920x1080 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log"  $base.1080p-vp9.webm
	_clean_logdir
}

. ./base.sh
