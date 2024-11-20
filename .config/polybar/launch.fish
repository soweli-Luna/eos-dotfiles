#!/usr/bin/env fish

polybar-msg cmd quit
pkill cava

#polybar -c ~/.config/polybar/bar1.ini bar1 2>&1 | tee -a /tmp/polybar1.log & disown

# set cava_conf (path dirname (status filename))/cava_config
# cava -p $cava_conf >(path dirname(status filename))/cava_output

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

if type "xrandr"
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1 | tac)
    switch $m 
    case '*DVI*'
      set truncate 27
    case 'eDP'
      set truncate 27
    case '*'
      set truncate 60
    end
    echo $m Detected, truncate=$truncate
    MONITOR=$m MEDIAPLAYER_LABEL="%output:0:$truncate:..%" XWINDOW_LABEL="%title:0:$truncate:..%" polybar -c ~/.config/polybar/bar1.ini bar1 --reload &
    sleep 1.0s
  end
else
  polybar --reload example &
end

echo "Bars launched..."
