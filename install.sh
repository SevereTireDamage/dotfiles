#!/bin/sh

git submodule update --init --recursive

# bash
[ -f ~/.bashrc-extra ] || echo source .bashrc-extra >> ~/.bashrc
cp -b bash/.bashrc-extra ~/.bashrc-extra

# vim
cp -b vimrc/vimrcs/basic.vim ~/.vimrc

# terminator
mkdir -p .config/terminator
cp -b --parents terminator/config ~/.config/

# high dpi preferences
highdpi/highdpi.sh

# compizconfig-settings-manager for gnonme-session-flashback
gnome-compiz/gnome-compiz.sh

