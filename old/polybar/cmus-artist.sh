#!/bin/bash
check=`exec cmus-remote -Q | grep status | cut -d " " -f 2-`
if [[ $check == *"stopped"* ]]; then
	echo " "
fi
title=`exec cmus-remote -Q | grep -m 1 title | cut -d " " -f 3-`
artist=`exec cmus-remote -Q | grep -m 1 artist | grep -v albumartist | cut -d " " -f 3-`
end=`cmus-remote -Q | grep -m 1 duration | cut -d " " -f 2-`
start=`cmus-remote -Q | grep -m 1 position | cut -d " " -f 2-`

endm=$(( end / 60 ))
ends=$(( end % 60 ))
ends2=$(( ends % 60))
startm=$(( start / 60 ))
starts=$(( start % 60 ))
starts2=$(( starts % 60))

if (( "$starts2" < 10 )); then
	starts3="0$starts"
else
	starts3=$starts
fi
if (( "$ends2" < 10 )); then
		ends3="0$ends"
else
		ends3=$ends
fi

if [[ $check == *"paused"* ]]; then
	echo "||  $artist - $title [$startm:$starts3 / $endm:$ends3]"
fi

if [[ $check == *"playing"* ]]; then
	echo ">>  $artist - $title [$startm:$starts3 / $endm:$ends3]"
fi
