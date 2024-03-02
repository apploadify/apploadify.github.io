#!/bin/bash

# Array zum Speichern von erstellten Dateien und Ordnern
created_files=()

# Funktion zum Hinzufügen von Dateien/Ordnern zur Liste der erstellten Dateien
add_to_created_files() {
    created_files+=("$1")
}

# Funktion zum Löschen aller erstellten Dateien und Ordner
cleanup() {
    for item in "${created_files[@]}"; do
        rm -rf "$item"
    done
}

# Funktion zum Ändern des Prompts
change_prompt() {
    if [ "$1" == "root" ]; then
        PS1="root@virtual~# "
    else
        PS1="test@virtual~$ "
    fi
}

# Initialisierung des Prompts
change_prompt "test"

# Haupt-Schleife
while true; do
    read -p "$PS1" input

    # Befehl und Argumente trennen
    command=$(echo "$input" | awk '{print $1}')
    args=$(echo "$input" | awk '{$1=""; print $0}' | xargs)

    case "$command" in
        nano)
            nano $args
            ;;
        cat)
            cat $args
            ;;
        mkdir)
            mkdir $args
            add_to_created_files "$args"
            ;;
        touch)
            touch $args
            add_to_created_files "$args"
            ;;
        ls)
            ls $args
            ;;
        clear)
            clear
            ;;
        cd)
            cd $args
            ;;
        mv)
            mv $args
            ;;
        rm)
            rm $args
            ;;
        sudo)
            read -s -p "Password: " password
            echo ""
            if [ "$password" == "root123" ]; then
                change_prompt "root"
            else
                echo "Sorry, wrong password."
            fi
            ;;
        exit)
            cleanup
            exit 0
            ;;
        *)
            echo "Unknown command: $command"
            ;;
    esac
done