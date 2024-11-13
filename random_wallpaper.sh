#!/bin/env zsh
cd ~/Backgrounds
TOTAL=$(ls | wc -l)
rand=$(shuf -i 1-$TOTAL -n 1)
echo $rand
feh --bg-fill $(ls | sed -n $rand"p")
echo $rand > .index
