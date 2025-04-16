#!/bin/sh


default_extention="png"
directory="$HOME/Images/Screenshots/Grimshot"

function copy_only(){

    name="$(date +"%d-%m-%Y_%H:%M").$default_extention"
    output="/tmp/$name"
    
    grim $output
    wl-copy < $output

    notify-send "Grimshot" "Screenshot has been made using:\n<b>Copy only mode</b>"
    exit
}

function normalScreenshot() {
    output="$directory/$name"
    
    grim $output
    wl-copy < $output

    notify-send "Grimshot" "Screenshot <i>$name</i> has been made and copied to clipboard"
}

if [ "$1" == "--copy_only" ]; then
    copy_only
fi

choice=$(printf "$(date +"%d-%m-%Y_%H:%M").$default_extention\nCustom name\nCopy only" | rofi -dmenu -p "Grimshot")

case "$choice" in
    "$(date +"%d-%m-%Y_%H:%M").$default_extention") name="$(date +"%d-%m-%Y_%H:%M").png" && normalScreenshot;;
    "Custom name") name=$(rofi -dmenu -p "Screenshot name").$default_extention;;
    "Copy only") copy_only ;;
    *) exit
esac

normalScreenshot
