#!/bin/sh
#
# Forces full resolution and custom scaling that I like on my laptop
#
# For whatever reason, these values aren't always shown in the settings
# panel for gnome-sessio-flashback, which I also like and use.
#

while true ; do
    read -p "Perform first-time configuration for high DPI? [y/N] " yn
    case $yn in
        [Yy]* ) break; ;;
        *) exit ;;
    esac
done

echo "OK! Setting resolutions and scaling to values you liked once."

if xrandr | grep -q Virtual1 ; then
    if xdpyinfo | grep -q '96x96 dots per inch' ; then
        echo "[+] This looks like a VM on a low DPI display ... forcing defaults."
        dconf write /com/ubuntu/user-interface/scale-factor "{'Virtual1': 10}"
        dconf write /org/gnome/desktop/interface/cursor-size 33
        dconf write /org/gnome/desktop/interface/text-scaling-factor 1
    else
        echo "[+] This looks like a VM on a retina display... coercing..."
        MODENAME="retina.sh_2880_1800_60.0"

        # Bail out if we've been here before, or if user opts out
        xrandr | grep $MODENAME && echo "Looks like we were already configured with your retina preferences" && exit

        # Mode line generated with:
        #   cvt 2880 1800 60
        xrandr --newmode "$MODENAME"  442.00  2880 3104 3416 3952  1800 1803 1809 1865 -hsync
        xrandr --addmode Virtual1 $MODENAME
        xrandr --output Virtual1 --mode $MODENAME

        # Gnome scaling for high DPI displays
        dconf write /com/ubuntu/user-interface/scale-factor "{'Virtual1': 11}"
        dconf write /org/gnome/desktop/interface/cursor-size 33
        dconf write /org/gnome/desktop/interface/text-scaling-factor 1.45
    fi
elif xrandr | grep eDP-1 ; then
    echo "[+] This looks like a native display!"

    # Gnome scaling for high DPI displays
    dconf write /com/ubuntu/user-interface/scale-factor "{'eDP-1-1': 14}" # this might actually do nothing
    dconf write /org/gnome/desktop/interface/cursor-size 60
    dconf write /org/gnome/desktop/interface/text-scaling-factor 2.2
else
    echo "[-] Not a display I'm familiar with..."
fi



