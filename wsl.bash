#!/bin/bash

export DISPLAY=$(route.exe print | grep 0.0.0.0 | head -1 | awk '{print $4}'):0.0 

xrdb ~/.Xresources 
urxvt -e zsh
