#!/usr/bin/env fish



# echo ''

switch (playerctl status)
case Playing    # if playing
    set symbol ⏵
case Paused    # if paused
    set symbol ⏸
case '*' 'No players found'    # not playing
    echo ''
    exit
end


switch (playerctl metadata album)
    case '' (playerctl metadata title)     # if no album or album is title
        playerctl metadata --format "$symbol {{title}} - {{artist}}"
    case '*'    # otherwise display album
        playerctl metadata --format "$symbol {{title}} - {{artist}} - {{album}}"
    end

