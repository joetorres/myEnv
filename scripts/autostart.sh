#!/bin/sh

~/.local/bin/fehbg.sh

traf=$($HOME/.local/bin/sb-nettraf.sh)
bat=$($HOME/.local/bin/sb-battery.sh)
clock=$($HOME/.local/bin/sb-clock.sh)

while true ; do xsetroot -name "$bat | $traf | $clock"; sleep 10; done &
