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

# Welcome back to game if it exists with info
echo "Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses."

# If it doesn't exist, create it in the DB

# Welcome if it is newly created
echo "Welcome, $(echo $USERNAME)! It looks like this is your first time here."

# ---Game---
# Welcome player
echo "Guess the secret number between 1 and 1000:"
read GUESS

# Error if not a number/int
echo "That is not an integer, guess again:"

# --loop--
# Detect guess is lower or higher than secret_number
# if lower
echo "It's lower than that, guess again:"

# if higher
echo "It's higher than that, guess again:"


# ---Win---
echo "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"