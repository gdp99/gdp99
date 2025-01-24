#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    TEAM1_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM1_ID ]]
    then
     INSERT_TEAM1=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
     TEAM1_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER'")
    fi
    TEAM2_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM2_ID ]]
    then
     INSERT_TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
     TEAM2_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT'")
    fi
    MATCH_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR' AND round='$ROUND' AND winner_id='$TEAM1_ID' AND opponent_id='$TEAM2_ID' AND winner_goals='$WINNER_GOALS' AND opponent_goals='$OPPONENT_GOALS'")
    if [[ -z $MATCH_ID ]]
    then
      INSERT_MATCH=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR','$ROUND','$TEAM1_ID','$TEAM2_ID','$WINNER_GOALS','$OPPONENT_GOALS')")
    fi
  fi
done
