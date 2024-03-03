#!/bin/bash

# Python script content
python_script=$(cat <<END
import discord
from discord.ext import commands
import tkinter as tk
from tkinter import messagebox

class DiscordBot(commands.Bot):
    def __init__(self, command_prefix, *args, **kwargs):
        super().__init__(command_prefix=command_prefix, *args, **kwargs)

    async def on_ready(self):
        print(f'Bot is ready. Logged in as {self.user}')

def start_bot(token, prefix, commands):
    bot = DiscordBot(command_prefix=prefix)
    
    for command in commands:
        @bot.command(name=command['name'])
        async def command_function(ctx):
            await ctx.send(command['response'])

    bot.run(token)

def create_bot():
    window = tk.Tk()
    window.title("Discord Bot GUI")

    tk.Label(window, text="Bot Token:").grid(row=0, column=0)
    tk.Label(window, text="Prefix:").grid(row=1, column=0)
    tk.Label(window, text="Command 1 Name:").grid(row=2, column=0)
    tk.Label(window, text="Command 1 Response:").grid(row=3, column=0)
    tk.Label(window, text="Command 2 Name:").grid(row=4, column=0)
    tk.Label(window, text="Command 2 Response:").grid(row=5, column=0)
    tk.Label(window, text="Command 3 Name:").grid(row=6, column=0)
    tk.Label(window, text="Command 3 Response:").grid(row=7, column=0)

    token_entry = tk.Entry(window)
    prefix_entry = tk.Entry(window)
    command1_name_entry = tk.Entry(window)
    command1_response_entry = tk.Entry(window)
    command2_name_entry = tk.Entry(window)
    command2_response_entry = tk.Entry(window)
    command3_name_entry = tk.Entry(window)
    command3_response_entry = tk.Entry(window)

    token_entry.grid(row=0, column=1)
    prefix_entry.grid(row=1, column=1)
    command1_name_entry.grid(row=2, column=1)
    command1_response_entry.grid(row=3, column=1)
    command2_name_entry.grid(row=4, column=1)
    command2_response_entry.grid(row=5, column=1)
    command3_name_entry.grid(row=6, column=1)
    command3_response_entry.grid(row=7, column=1)

    def start_bot_from_gui():
        token = token_entry.get()
        prefix = prefix_entry.get()
        commands = [
            {'name': command1_name_entry.get(), 'response': command1_response_entry.get()},
            {'name': command2_name_entry.get(), 'response': command2_response_entry.get()},
            {'name': command3_name_entry.get(), 'response': command3_response_entry.get()}
        ]
        start_bot(token, prefix, commands)

    tk.Button(window, text="Start Bot", command=start_bot_from_gui).grid(row=8, columnspan=2)

    window.mainloop()

if __name__ == "__main__":
    create_bot()
END
)

# Write to Python file
echo "$python_script" > bot_gui.py

echo "Python script written to bot_gui.py"