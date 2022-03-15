#!/bin/sh

~/.local/bin/fehbg.sh

while true ; do clock=$($HOME/.local/bin/sb-clock.sh) && bat=$($HOME/.local/bin/sb-battery.sh) && traf=$($HOME/.local/bin/sb-nettraf.sh) && xsetroot -name "$bat | $traf | $clock"; sleep 10; done &
