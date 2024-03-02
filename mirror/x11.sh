#!/bin/bash

pkg install x11-repo && pkg install tigervnc

echo 'export DISPLAY=":1"' > ~/.bash_profile

pkg install python-tkinter

echo "X11 Repo erfolgreich installiert"
