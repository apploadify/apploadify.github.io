#!/bin/bash

# Überprüfe, ob xdotool installiert ist
if ! command -v xdotool &> /dev/null; then
    echo "xdotool ist nicht installiert. Installation wird durchgeführt..."
    apt-get update
    apt-get install xdotool -y
fi

# Starte den Linux-Terminal
gnome-terminal &

# Warte eine Sekunde, damit sich der Terminal öffnet
sleep 1

# Sendet Befehle an den Terminal, um das PowerShell-Design und die Einstellungen anzuwenden
xdotool search --sync --onlyvisible --class "gnome-terminal" key ctrl+shift+t
xdotool search --sync --onlyvisible --class "gnome-terminal" key ctrl+shift+p
xdotool search --sync --onlyvisible --class "gnome-terminal" type "Set-PSReadlineOption -Colors @{HostDefaultForegroundColor=\"#FFFFFFFF\";HostDefaultBackgroundColor=\"#FF0C0C0C\";ErrorForegroundColor=\"#FFFF0000\";ErrorBackgroundColor=\"#FF0C0C0C\";WarningForegroundColor=\"#FFFFFACD\";WarningBackgroundColor=\"#FF0C0C0C\";DebugForegroundColor=\"#FF6495ED\";DebugBackgroundColor=\"#FF0C0C0C\";VerboseForegroundColor=\"#FF00CED1\";VerboseBackgroundColor=\"#FF0C0C0C\";EmphasisForegroundColor=\"#FF00CED1\";EmphasisBackgroundColor=\"#FF0C0C0C\";CommentForegroundColor=\"#FF00FF00\";CommentBackgroundColor=\"#FF0C0C0C\"}"
xdotool search --sync --onlyvisible --class "gnome-terminal" key Return

# Öffnet ein neues PowerShell-Terminal
xdotool search --sync --onlyvisible --class "gnome-terminal" key ctrl+shift+t

# Warte eine Sekunde, damit sich das neue Terminal öffnet
sleep 1

# Wechseln zum neuen Terminal und führen PowerShell-Befehle aus
xdotool search --sync --onlyvisible --class "gnome-terminal" key ctrl+shift+p
xdotool search --sync --onlyvisible --class "gnome-terminal" type "pwsh"
xdotool search --sync --onlyvisible --class "gnome-terminal" key Return

# Führe den PowerShell-Startbefehl aus
xdotool search --sync --onlyvisible --class "gnome-terminal" type ". ~/.bashrc"
xdotool search --sync --onlyvisible --class "gnome-terminal" key Return