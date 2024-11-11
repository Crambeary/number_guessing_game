#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

# Ask for username
echo "Enter your username:"
read USERNAME

# Detect if it exists
USERNAME_EXISTS=$($PSQL "SELECT username, games_played, best_game FROM number_guess WHERE username='$USERNAME'")
if [[ -z $USERNAME_EXISTS ]]; then
  # If it doesn't exist, create it in the DB
  INSERT_INTO=$($PSQL "INSERT INTO number_guess(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
  if [[ ! -z $INSERT_NAME ]]; then
    echo "Error adding new user, make sure your username is 22 or less characters"
    echo $INSERT_NAME
  fi
  # Welcome if it is newly created
  echo "Welcome, $(echo $USERNAME)! It looks like this is your first time here."
else
  echo "$USERNAME_EXISTS" | while read NAME BAR GAMES_PLAYED BAR BEST_GAME
  do
  # Welcome back to game if it exists with info
    echo "Welcome back, $(echo $NAME)! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi



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