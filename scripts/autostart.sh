#!/bin/sh

~/.local/bin/fehbg.sh

while true ; do xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'`"; sleep 1m ; done &
