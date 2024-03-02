#!/bin/bash

# Überprüfen, ob ein Dateiname als Argument übergeben wurde
if [ $# -eq 0 ]; then
    echo "Bitte geben Sie einen Dateinamen als Argument ein."
    exit 1
fi

# Dateiname extrahieren (ohne Erweiterung)
filename=$(basename "$1" | cut -d. -f1)

# Überprüfen, ob die Excel-Datei bereits existiert
if [ -f "$filename.xlsx" ]; then
    echo "Die Excel-Datei existiert bereits."
else
    touch "$filename.xlsx"
    echo "Die Excel-Datei wurde erstellt."
fi

# Funktion zum Schreiben in die Excel-Datei
write_to_excel() {
    column=$1
    row=$2
    data=$3
    echo "$data" | xlsxwriter "$filename.xlsx" --sheet "Sheet1" --row "$row" --col "$column" --data -
}

# Funktion zum Lesen aus der Excel-Datei und Anzeigen im Terminal
read_from_excel() {
    cat "$filename.xlsx" | xlsx2csv
}

# Hauptfunktion für die Verarbeitung der Eingaben
process_input() {
    input=$1
    commands=($input)
    if [ "${commands[0]}" == "spalte" ]; then
        column="${commands[1]}"
        row="${commands[2]}"
        data="${commands[@]:3}"
        write_to_excel "$column" "$row" "$data"
    elif [ "${commands[0]}" == "read" ]; then
        read_from_excel
    else
        echo "Ungültiger Befehl. Verwenden Sie 'spalte' zum Schreiben oder 'read' zum Lesen der Excel-Tabelle."
    fi
}

# Verarbeiten der Eingabeaufforderungen
while true; do
    read -p "Geben Sie einen Befehl ein (z.B. 'spalte 1 zeile 1 Hallo' oder 'read' zum Lesen der Tabelle): " input
    process_input "$input"
don
