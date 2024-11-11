#!/bin/bash

# Database needs
# username VARCHAR(22)
# games_played INT - total number of games played
# best_game INT - fewest number of guesses to win


PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

# Ask for username
echo "Enter your username:"
read USERNAME

# Detect that it's 22 characters or less
# Detect if it exists
# Welcome if it exists
echo "Welcome, $(echo $USERNAME)! It looks like this is your first time here."