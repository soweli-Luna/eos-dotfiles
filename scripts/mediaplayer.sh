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
        playerctl metadata --format $icon" {{trunc(title, 40)}} - {{trunc(artist, 20)}} "
        ;;
    $(playerctl metadata title)) # Album name equal to song title
        playerctl metadata --format $icon" {{trunc(title, 40)}} - {{trunc(artist, 20)}} "
        ;;
    *) # All info available
        playerctl metadata --format $icon" {{trunc(title, 40)}} - {{trunc(artist, 20)}} - {{trunc(album, 20)}}"
        ;;
esac
