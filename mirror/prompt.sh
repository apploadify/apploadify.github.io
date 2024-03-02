#!/bin/bash

# Eingabeaufforderung für den gewünschten Prompt
echo "Wie soll der Prompt aussehen? (z.B. 'user@hostname:~/directory$ ')"
read new_prompt

# Erstelle den Prompt und speichere ihn in der ~/.bashrc Datei
echo "PS1=\"$new_prompt\"" >> ~/.bashrc

# Lade die geänderte .bashrc Datei
source ~/.bashrc

echo "Prompt wurde erfolgreich geändert!"
