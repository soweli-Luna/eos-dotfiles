#!/bin/env zsh
cd /usr/share/endeavouros/backgrounds/custom
feh --bg-scale $(ls | shuf -n 1)
