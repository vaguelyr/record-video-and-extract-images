#!/bin/bash
# vague
# record video, then split video into a lot of frames

# setup
mkdir -p videos
pushd videos || exit
ext=.mpg
fileNum=$(( $(ls -1 | wc -l) / 2 ))
fileName=out$fileNum
echo recording to $fileName.mpg

# make the video
ffmpeg -i /dev/video0 -s 1280x720  $fileName$ext


# extract frames
echo now extracting
mkdir $fileName
pushd $fileName || exit
ffmpeg -i ../$fileName$ext out%03d.png

echo finished with $fileName$ext

# display
eom * 

