#!/bin/bash

# Starte den VNC-Server mit localhost
vncserver -localhost

# Warte eine Sekunde, um sicherzustellen, dass der VNC-Server gestartet wurde
sleep 1

# Gib das Passwort automatisch ein (root123)
echo "root123" | vncpasswd -f > ~/.vnc/passwd

# Beende den Setup
vncserver -kill :

clear

echo "VNC Server SetUp erfolgreich, Passwort: root123
