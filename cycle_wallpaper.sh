#!/bin/env zsh
cd ~/Backgrounds
TOTAL=$(ls | wc -l)
CURRENT=$(< .index)

if [[ $1 == "next" ]]
then
  NEW=$((CURRENT % TOTAL + 1))
elif [[ $1 == "previous" ]]
then
  NEW=$(((CURRENT+TOTAL-2) % TOTAL+1))
else
  echo "Invalid argument, (next | previous)" 1>&2
  exit 2
fi

echo $NEW > .index
FILE=$(ls | sed -n $NEW"p")
feh --bg-fill $FILE
