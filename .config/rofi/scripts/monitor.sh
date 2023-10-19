#!/bin/bash

XRANDR=$(which xrandr)

TITLES=()
COMMANDS=()
MODES=()

EXTERNAL_OUTPUT="DP-1-3"
EXTERNAL_OUTPUT_2="DP-1-1"
TV_OUTPUT="DP-1"
INTERNAL_OUTPUT="eDP-1"

TILES[0]="CANCEL"
COMMANDS[0]="true"

# EXTERNAL MODE
TILES[1]="EXTERNAL"
COMMANDS[1]="xrandr \
             --output $INTERNAL_OUTPUT --off \
             --output $EXTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT_2 --auto --right-of-of $EXTERNAL_OUTPUT \
             --output $TV_OUTPUT --off"

# INTERNAL MODE
TILES[2]="INTERNAL"
COMMANDS[2]="xrandr \
             --output $INTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT --off \
             --output $EXTERNAL_OUTPUT_2 --off \
             --output $TV_OUTPUT --off"

# CLONES MODE
TILES[3]="CLONES"
COMMANDS[3]="xrandr \
             --output $INTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT \
             --output $EXTERNAL_OUTPUT_2 --off \
             --output $TV_OUTPUT --off"

# TV MODE
TILES[4]="TV"
COMMANDS[4]="xrandr \
             --output $INTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT --off \
             --output $EXTERNAL_OUTPUT_2 --off \
             --output $TV_OUTPUT --auto --right-of $INTERNAL_OUTPUT"

# WORK MODE
TILES[5]="WORK"
COMMANDS[5]="xrandr \
             --output $INTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT \
             --output $EXTERNAL_OUTPUT_2 --auto --right-of $EXTERNAL_OUTPUT --rotate normal \
             --output $TV_OUTPUT --off"

# WORK-ROTATION MODE
TILES[6]="WORK-ROTATION"
COMMANDS[6]="xrandr \
             --output $INTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT --auto --right-of $INTERNAL_OUTPUT \
             --output $EXTERNAL_OUTPUT_2 --auto --right-of $EXTERNAL_OUTPUT --rotate left \
             --output $TV_OUTPUT --off"

# HOME MODE
TILES[7]="HOME"
COMMANDS[7]="xrandr \
             --output $INTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT \
             --output $EXTERNAL_OUTPUT_2 --auto --left-of $EXTERNAL_OUTPUT --rotate normal \
             --output $TV_OUTPUT --off"

# HOME-ROTATION MODE
TILES[8]="HOME-ROTATION"
COMMANDS[8]="xrandr \
             --output $INTERNAL_OUTPUT --auto \
             --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT --rotate left \
             --output $EXTERNAL_OUTPUT_2 --auto --left-of $EXTERNAL_OUTPUT \
             --output $TV_OUTPUT --off"

# Generate entries, where first is key.
function gen_entries()
{
    for a in $(seq 0 $(( ${#TILES[@]} -1 )))
    do
        echo $a ${TILES[a]}
    done
}

# Call menu
SEL=$( gen_entries | rofi -dmenu -p "Monitor Setup: " -a 0 -no-custom  | awk '{print $1}' )

# Call xrandr
$( ${COMMANDS[$SEL]} )

# Echo to file for i3 bar
if [ $SEL -ne 0 ]; then
    echo "${TILES[$SEL]}" > /tmp/monitor_mode.dat
fi
