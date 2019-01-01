#!/bin/sh

for i in `find . -iname \*.mp4 | sort`; do
  par2 c $i
done;
