#!/bin/sh

git submodule update --init --recursive

# bash
cp -b bash/.bashrc-extra ~/.bashrc-extra
echo source .bashrc-extra >> ~/.bashrc

# vim
cp -b vimrc/vimrcs/basic.vim ~/.vimrc

