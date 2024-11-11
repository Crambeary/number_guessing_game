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
# Create a random number for the game between 1 and 1000 inclusively
# Using shuf instead of $RANDOM since it appears to be even in the randomness
RANDOM_NUMBER=$(var=1000 && shuf -i 1-${var} -n 1)

TRIES=0
GAME_WON=FALSE

GUESS_NUMBER() {
  TRIES=$(($TRIES+1))
  read GUESS
  
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    # Error if not a number/int
    echo "That is not an integer, guess again:"
    GUESS_NUMBER
  fi
  
  # Detect guess is lower or higher than secret_number
  if [[ $GUESS -gt $RANDOM_NUMBER ]]; then
    # if lower
    echo "It's lower than that, guess again:"
    GUESS_NUMBER
  fi  

  if [[ $GUESS -lt $RANDOM_NUMBER ]]; then
    # if higher
    echo "It's higher than that, guess again:"
    GUESS_NUMBER
  fi

  if [[ $GUESS -eq $RANDOM_NUMBER ]]; then
    # ---Win---
    GAME_WIN=TRUE
  fi  
}

# Welcome player
echo "Guess the secret number between 1 and 1000:"
GUESS_NUMBER

USERNAME_EXISTS=$($PSQL "SELECT username, games_played, best_game FROM number_guess WHERE username='$USERNAME'")
echo "$USERNAME_EXISTS" | while read NAME BAR GAMES_PLAYED BAR BEST_GAME
do
  GAMES_PLAYED=$(($GAMES_PLAYED+1))
  echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  INSERT_WIN=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
  # echo $INSERT_WIN
  if [[ $TRIES -lt $BEST_GAME || $BEST_GAME -eq 0 ]]; then
    INSERT_BEST=$($PSQL "UPDATE number_guess SET best_game=$TRIES WHERE username='$USERNAME'")
    # echo $INSERT_BEST
  fi
done