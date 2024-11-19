#!/usr/bin/env zsh

case $(playerctl status 2> /dev/null) in
    Playing)
        icon="⏵"
        ;;
    Paused)
        icon="⏸"
        ;;
    *)
        echo ""
        exit
        ;;
esac

case $(playerctl metadata album 2> /dev/null) in
    "") # No album name
        playerctl metadata --format $icon" {{trunc(title, 40)}} - {{trunc(artist, 25)}}"
        ;;
    $(playerctl metadata title)) # Album name equal to song title
        playerctl metadata --format $icon" {{trunc(title, 40)}} - {{trunc(artist, 25)}}"
        ;;
    *) # All info available
        playerctl metadata --format $icon" {{trunc(title, 40)}} - {{trunc(artist, 25)}} - {{trunc(album, 25)}}"
        ;;
esac
