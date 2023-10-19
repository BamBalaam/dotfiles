#!/bin/bash

# ROFI main menu choices
function menuchoices()
{
  echo "1) Personal"
  echo "2) Famoco"
  echo "3) Life Tracker"
}

SEL=$( menuchoices | rofi -dmenu -i -p "Pick Obsidian Vault: " -a 0 -no-custom  | awk '{print $1}' )

if [ "$SEL" == "1)" ]; then
   flatpak run md.obsidian.Obsidian "obsidian://open?vault=Personal"
elif [ "$SEL" == "2)" ]; then
   flatpak run md.obsidian.Obsidian "obsidian://open?vault=Famoco"
elif [ "$SEL" == "3)" ]; then
   flatpak run md.obsidian.Obsidian "obsidian://open?vault=LifeTracker"
fi
