#!/bin/bash
check=`exec cmus-remote -Q | grep status | cut -d " " -f 2-`
if [[ $check == *"stopped"* ]]; then
	echo " "
fi
title=`exec cmus-remote -Q | grep title | cut -d " " -f 3-`
artist=`exec cmus-remote -Q | grep artist | grep -v albumartist | cut -d " " -f 3-`
tracknum=`exec cmus-remote -Q | grep tracknumber | cut -d " " -f 3-`
if [[ $check == *"paused"* ]]; then
	echo "||  $artist - $tracknum. $title"
fi
if [[ $check == *"playing"* ]]; then
	echo ">>  $artist - $tracknum. $title"
fi
