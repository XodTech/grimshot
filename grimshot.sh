#!/bin/sh

directory="/home/user/Images/Screenshots/Grimshot"
name=$(date +"%d-%m-%Y_%H:%M").png
output="$directory/$name"

grim $output
wl-copy < $output

notify-send "Grimshot" "Screenshot <i>$name</i> has been made"
