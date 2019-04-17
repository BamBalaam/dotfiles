#!/bin/bash
EXTERNAL_OUTPUT="DP-1-1"
EXTERNAL_OUTPUT_2="DP-1-3"
TV_OUTPUT="DP-1"
INTERNAL_OUTPUT="eDP-1"


# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
    monitor_mode="WORK"

# otherwise read the value from the file
else
    monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "WORK" ]; then
    monitor_mode="EXTERNAL"
    xrandr --output $INTERNAL_OUTPUT --off
    xrandr --output $EXTERNAL_OUTPUT --auto
    xrandr --output $EXTERNAL_OUTPUT_2 --auto --right-of-of $EXTERNAL_OUTPUT
    xrandr --output $TV_OUTPUT --off
elif [ $monitor_mode = "EXTERNAL" ]; then
    monitor_mode="INTERNAL"
    xrandr --output $INTERNAL_OUTPUT --auto
	xrandr --output $EXTERNAL_OUTPUT --off
    xrandr --output $EXTERNAL_OUTPUT_2 --off
    xrandr --output $TV_OUTPUT --off
elif [ $monitor_mode = "INTERNAL" ]; then
    monitor_mode="CLONES"
    xrandr --output $INTERNAL_OUTPUT --auto
	xrandr --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
    xrandr --output $EXTERNAL_OUTPUT_2 --off
    xrandr --output $TV_OUTPUT --off
elif [ $monitor_mode = "CLONES" ] ; then
    monitor_mode="TV"
    xrandr --output $INTERNAL_OUTPUT --auto
    xrandr --output $EXTERNAL_OUTPUT --off
    xrandr --output $EXTERNAL_OUTPUT_2 --off
    xrandr --output $TV_OUTPUT --auto --right-of $INTERNAL_OUTPUT
elif [ $monitor_mode = "TV" ] ; then
    monitor_mode="WORK-ROTATION"
    xrandr --output $INTERNAL_OUTPUT --auto
    xrandr --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT
    xrandr --output $EXTERNAL_OUTPUT_2 --auto --right-of $EXTERNAL_OUTPUT --rotate left
    xrandr --output $TV_OUTPUT --off
else
    monitor_mode="WORK"
    xrandr --output $INTERNAL_OUTPUT --auto
    xrandr --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT
    xrandr --output $EXTERNAL_OUTPUT_2 --auto --right-of $EXTERNAL_OUTPUT --rotate normal
    xrandr --output $TV_OUTPUT --off
fi

echo "${monitor_mode}" > /tmp/monitor_mode.dat
