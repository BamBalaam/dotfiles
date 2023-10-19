#!/bin/bash

if [ -z "$1" ];
then
    echo "please enter 'up' or 'down'"
    exit 1
fi

MONITORS=$(xrandr | grep " connected " | awk '{ print$1 }')

BRI=$(head -n 1 /tmp/brightness.dat)

if [ "$1" == "up" ];
then
    BRI_AFTER=$(bc -l <<<"${BRI}+0.1")
elif [ "$1" == "down" ]
then
    BRI_AFTER=$(bc -l <<<"${BRI}-0.1")
else
    echo "please enter 'up' or 'down'"
    exit 1
fi

echo $BRI_AFTER > /tmp/brightness.dat

for a in $MONITORS
do
    $(xrandr --output $a --brightness $BRI_AFTER)
done
