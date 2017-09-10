#!/bin/sh
#
# Forces full resolution and custom scaling that I like on my laptop
#
# For whatever reason, these values aren't always shown in the settings
# panel for gnome-sessio-flashback, which I also like and use.
#

MODENAME="retina.sh_2880_1800_60.0"

# Bail out if we've been here before, or if user opts out
xrandr | grep $MODENAME && echo "Looks like we were already configured with your retina preferences" && exit

while true ; do
    read -p "Perform first-time configuration for retina display? [y/N] " yn
    case $yn in
        [Yy]* ) break; ;;
        *) exit ;;
    esac
done

echo "OK! Setting resolutions and scaling to values you liked once."

# Mode line generated with:
#   cvt 2880 1800 60
xrandr --newmode "$MODENAME"  442.00  2880 3104 3416 3952  1800 1803 1809 1865 -hsync
xrandr --addmode Virtual1 $MODENAME
xrandr --output Virtual1 --mode $MODENAME

# Gnome scaling for high DPI displays
dconf write /com/ubuntu/user-interface/scale-factor "{'Virtual1': 11}"
dconf write /org/gnome/desktop/interface/cursor-size 33
dconf write /org/gnome/desktop/interface/text-scaling-factor 1.45

