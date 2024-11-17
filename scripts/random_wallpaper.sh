#!/bin/env zsh
cd ~/Backgrounds
TOTAL=$(ls | wc -l)
rand=$(shuf -i 1-$TOTAL -n 1)
file=$(ls | sed -n $rand"p")
echo $rand > .index
feh --bg-fill $file
notify-send -t 2000 "Wallpaper" "<b>$rand</b> - $file"
