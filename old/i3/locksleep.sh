#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png /home/julian/.config/i3/lockicon.png -gravity center -composite -matte /tmp/screen.png
systemctl suspend
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
