#!/usr/bin/env zsh
pstatus=$(playerctl status 2> /dev/null)
case $pstatus in
    Playing|Paused)
        icon="⏵"
        if [[ $pstatus == "Paused" ]]
        then
            icon="⏸"
        fi
        case $(playerctl metadata album 2> /dev/null) in
            "") # No album name
                playerctl metadata --format $icon" {{title}} - {{artist}}"
                ;;
            $(playerctl metadata title)) # Album name equal to song title
                playerctl metadata --format $icon" {{title}} - {{artist}}"
                ;;
            *) # All info available
                playerctl metadata --format $icon" {{title}} - {{artist}} - {{album}}"
                ;;
        esac
        ;;
    *)
        echo ""
        ;;
esac
