#!/bin/bash

# Funktion zum Ändern des Terminal-Designs
change_terminal_design() {
    # Frag nach der Farbe
    read -p "Möchtest du das Terminal in Dunkelgrün oder Rot anzeigen lassen? (G/D/R): " color_choice

    # Überprüfe die Eingabe und ändere das Terminal-Design entsprechend
    if [[ $color_choice == "D" || $color_choice == "d" ]]; then
        PS1='\[\033[0;32m\]~#\[\033[0m\] '
    elif [[ $color_choice == "R" || $color_choice == "r" ]]; then
        PS1='\[\033[0;31m\]~#\[\033[0m\] '
    else
        echo "Ungültige Eingabe. Das Terminal bleibt unverändert."
        return 1
    fi

    # Setze den neuen Prompt
    export PS1
}

# Rufe die Funktion auf
change_terminal_design

# Starte die interaktive Shell
bas
