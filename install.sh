#!/bin/sh

git submodule update --init --recursive

cp -b vimrc/vimrcs/basic.vim ~/.vimrc
cp -b .bashrc ~/.bashrc

