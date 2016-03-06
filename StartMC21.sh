#!/bin/bash
export USER=pi
ps -e | grep tightvnc || vncserver :1 -geometry 1920x1080
export DISPLAY=':1'
ps -e | grep mediacenter || mediacenter21 /mediaserver
