#!/bin/bash

TILES=()
TILES[0]="CANCEL"
TILES[1]="0.1"
TILES[2]="0.2"
TILES[3]="0.3"
TILES[4]="0.4"
TILES[5]="0.5"
TILES[6]="0.6"
TILES[7]="0.7"
TILES[8]="0.8"
TILES[9]="0.9"
TILES[10]="1.0"

# Generate entries, where first is key.
function gen_entries()
{
    for a in $(seq 0 $(( ${#TILES[@]} -1 )))
    do
        echo ${TILES[a]}
    done
}

# Call menu
SEL=$( gen_entries | rofi -dmenu -p "Luminosity: " -a 0 -no-custom  | awk '{print $1}' )

MONITORS=$(xrandr | grep " connected " | awk '{ print$1 }')

for a in $MONITORS
do
    $(xrandr --output $a --brightness $SEL)
done

