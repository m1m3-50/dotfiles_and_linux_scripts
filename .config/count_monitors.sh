#!/bin/bash

MONITOR_COUNT=`xrandr --listactivemonitors | grep -v 'Monitors:' | awk -F' ' '{print $2};' | sed 's/[\+\*]//g' | wc -l`

echo $MONITOR_COUNT
