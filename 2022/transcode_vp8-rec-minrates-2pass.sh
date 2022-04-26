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
	echo $ffmpeglogdir
	ffmpeg -i $in -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -minrate 1228k -crf 33 -threads $threads -s 854x480 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null 
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -minrate 1228k -crf 33 -threads $threads -s 854x480 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log" $base.480p-vp8.webm
	_clean_logdir
}

run_360() {
	_make_logdir
	ffmpeg -i $in -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 36 -minrate 690k -threads $threads -s 640x360 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -minrate 690k -crf 36 -threads $threads -s 640x360 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log"  $base.360p-vp8.webm
	_clean_logdir
}

run_720() {
	_make_logdir
	ffmpeg -i $in -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 32 -minrate 2763k -threads $threads -s 1280x720 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 32 -minrate 2763k -threads $threads -s 1280x720 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log"  $base.720p-vp8.webm
	_clean_logdir
}

run_1080() {
	_make_logdir
	ffmpeg -i $in -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 31 -minrate 6216k -threads $threads -s 1920x1080 $frame_rate -pass 1 -passlogfile "$ffmpeglogdir/log" -an -f null /dev/null
	ffmpeg -i $in -acodec libvorbis -ac 2 -b:a 96k -vcodec libvpx -quality good -cpu-used 0 -b:v 0 -crf 31 -minrate 6216k -threads $threads -s 1920x1080 $frame_rate -pass 2 -passlogfile "$ffmpeglogdir/log"  $base.1080p-vp8.webm
	_clean_logdir
}

. ./base.sh
