#!/bin/sh


default_extention="png"
directory="$HOME/Images/Screenshots/Grimshot"

function copy_only(){

    name="tmp.png"
    output="$directory/$name"
    
    grim $output
    wl-copy < $output
    rm $output

    notify-send "Grimshot" "Screenshot <i>$name</i> has been made using:\n<b>Copy only mode</b>"
    exit
}

function normalScreenshot() {
    if [ "$name" == ".$default_extention" ]; then
        exit
    fi
    output="$directory/$name"
    
    grim $output
    wl-copy < $output

    notify-send "Grimshot" "Screenshot <i>$name</i> has been made"
}

choice=$(printf "$(date +"%d-%m-%Y_%H:%M").$default_extention\nCopy only\n" | rofi -dmenu -p "Grimshot")

case "$choice" in
  "$(date +"%d-%m-%Y_%H:%M").$default_extention") name="$(date +"%d-%m-%Y_%H:%M").png" && normalScreenshot;;
  "Copy only") copy_only ;;
  *) name=$choice.$default_extention;;
esac

normalScreenshot
