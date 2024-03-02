#!/bin/bash

# Funktion zum temporären Ändern des Terminal-Prompts
change_temp_prompt() {
    # Frag nach der Farbe
    read -p "Möchtest du das Terminal-Prompt temporär in Dunkelgrün ändern? (J/N): " color_choice

    # Überprüfe die Eingabe und ändere den Prompt temporär entsprechend
    if [[ $color_choice == "J" || $color_choice == "j" ]]; then
        temp_PS1='\[\033[0;32m\]~#\[\033[0m\] '
    elif [[ $color_choice == "N" || $color_choice == "n" ]]; then
        temp_PS1='\[\033[0m\]~$ '
    else
        echo "Ungültige Eingabe. Das Terminal-Prompt bleibt unverändert."
        return 1
    fi

    # Setze den temporären Prompt
    export PS1="$temp_PS1"
}

# Rufe die Funktion auf, um den Prompt temporär zu ändern
change_temp_prompt

# Warte auf Benutzereingabe
while true; do
    read -p "Gib 'Exit' ein, um den Prompt zurückzusetzen und fortzufahren: " user_input
    if [[ "$user_input" == "Exit" ]]; then
        break
    else
        echo "Ungültige Eingabe. Bitte gib 'Exit' ein, um fortzufahren."
    fi
done

# Setze den ursprünglichen Prompt zurück
export PS1='\[\033[0m\]~$ '
