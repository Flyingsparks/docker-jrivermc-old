#!/bin/bash
export USER=pi
ps -e | grep x11vnc || x11vnc :0 -localhost -geometry 1920x1080
export DISPLAY=':0'
ps -e | grep mediacenter || mediacenter21 /mediaserver
