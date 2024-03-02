#!/bin/bash

pip install discord.py

echo "import discord
from discord.ext import commands

intents = discord.Intents.default()
intents.message_content = True
bot = commands.Bot(command_prefix='>', intents=intents)

@bot.command()
async def ping(ctx):
    await ctx.send('pong')

bot.run('token')" > bot.py

echo "Please change Token in bot.py in your real bot Token, discord SetUp succesfull"