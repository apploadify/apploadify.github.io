#!/bin/bash

pkg update && pkg upgrade

pkg install python3

pkg install openjdk-17

pkg install kotlin

clear

echo "Base SetUp erfolgreich"
