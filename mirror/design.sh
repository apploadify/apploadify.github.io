#!/bin/bash

# Funktion zum Ändern des Terminal-Prompts
change_prompt() {
    # Frag nach der Farbe
    read -p "Möchtest du das Terminal-Prompt in Dunkelgrün ändern? (J/N): " color_choice

    # Überprüfe die Eingabe und ändere den Prompt entsprechend
    if [[ $color_choice == "J" || $color_choice == "j" ]]; then
        PS1='\[\033[0;32m\]~#\[\033[0m\] '
    elif [[ $color_choice == "N" || $color_choice == "n" ]]; then
        PS1='\[\033[0m\]~$ '
    else
        echo "Ungültige Eingabe. Das Terminal-Prompt bleibt unverändert."
        return 1
    fi

    # Setze den neuen Prompt
    export PS1
}

# Rufe die Funktion auf
change_prompt
