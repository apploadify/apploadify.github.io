#!/bin/bash

# Erstelle den Python-Code
cat <<EOF > webhook.py
import requests
import time
import threading

class DiscordMessageSender:
    def __init__(self):
        self.message = ""
        self.webhook_url = ""
        self.send_interval = 1
        self.send_flag = False
        self.thread = None

    def get_input(self):
        self.message = input("Bitte geben Sie die Nachricht ein, die Sie senden möchten: ")
        self.webhook_url = input("Bitte geben Sie die Discord Webhook URL ein: ")
        self.send_interval = int(input("Bitte geben Sie die Anzahl der Nachrichten ein, die pro Sekunde gesendet werden sollen: "))

    def send_message(self):
        while self.send_flag:
            requests.post(self.webhook_url, json={"content": self.message})
            time.sleep(1 / self.send_interval)

    def start_sending(self):
        if not self.send_flag:
            self.send_flag = True
            self.thread = threading.Thread(target=self.send_message)
            self.thread.start()
            print("Nachrichtenversand gestartet.")

    def stop_sending(self):
        if self.send_flag:
            self.send_flag = False
            self.thread.join()
            print("Nachrichtenversand gestoppt.")

    def display_info(self):
        print("Nachricht:", self.message)
        print("Webhook URL:", self.webhook_url)

    def run(self):
        while True:
            cmd = input("Manager: Bitte geben Sie einen Befehl ein (start, stop, info, exit): ").lower()
            if cmd == "start":
                self.start_sending()
            elif cmd == "stop":
                self.stop_sending()
            elif cmd == "info":
                self.display_info()
            elif cmd == "exit":
                print("Programm beendet.")
                break
            else:
                print("Ungültiger Befehl. Bitte geben Sie start, stop, info oder exit ein.")

if __name__ == "__main__":
    sender = DiscordMessageSender()
    sender.get_input()
    sender.run()
EOF

echo "Python-Skript wurde erfolgreich erstellt."
