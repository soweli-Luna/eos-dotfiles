#!/bin/env zsh
cd ~/Backgrounds
total=$(ls | wc -l)
current=$(< .index)

if [[ $1 == "next" ]]
then
  new=$((current % total + 1))
elif [[ $1 == "previous" ]]
then
  new=$(((current+total-2) % total+1))
else
  echo "invalid argument, (next | previous)" 1>&2
  exit 2
fi

echo $new > .index
file=$(ls | sed -n $new"p")
feh --bg-fill $file
notify-send -t 2000 "wallpaper" "<b>$new</b> - $file" 
