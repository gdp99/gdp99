#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=postgres --tuples-only -c"

echo -e "\n~~NUMBER GUESS GAME~~"

NUMBER=$(((1+RANDOM)%1000))

echo -e "\nEnter your username:"
read -n 22 USERNAME
USERNAME_ID=$($PSQL "SELECT player_id FROM players_stats WHERE username='$USERNAME'")
if [[ -z $USERNAME_ID ]]
then
  INSERT_USERNAME=$($PSQL "INSERT INTO "players_stats"(username) VALUES('$USERNAME')")
  USERNAME_ID=$($PSQL "SELECT player_id FROM players_stats WHERE username='$USERNAME'")
  BEST_GAME=32765
  GAMES_PLAYED=0
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players_stats WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM players_stats WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
fi

echo "Guess the secret number between 1 and 1000:"
read ATTEMPT

GUESSES=0;

GAME(){
  if [[ ! $ATTEMPT =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read ATTEMPT
    GAME;
  elif [[ $ATTEMPT == $NUMBER ]]
  then
    GAMES_PLAYED=$((GAMES_PLAYED+1))
    GUESSES=$((GUESSES+1))
    UPDATE_GAMES=$($PSQL "UPDATE players_stats SET games_played=$GAMES_PLAYED WHERE player_id=$USERNAME_ID")
    if [[ $GUESSES < $BEST_GAME ]]
    then
      INSERT_BEST=$($PSQL "UPDATE players_stats SET best_game=$GUESSES WHERE player_id=$USERNAME_ID")
    fi
    echo "You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
  elif [[ $ATTEMPT > $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read ATTEMPT
    GUESSES=$((GUESSES+1))
    GAME
  elif [[ $ATTEMPT < $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    read ATTEMPT
    GUESSES=$((GUESSES+1))
    GAME
  fi
}

GAME;
