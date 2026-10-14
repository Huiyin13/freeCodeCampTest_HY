#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "
CREATE TABLE IF NOT EXISTS csv_data (
    
    year INT,
    round VARCHAR(50),
    winner VARCHAR(100),
    opponent VARCHAR(100),
    winner_goals INT ,opponent_goals INT
);
"
$PSQL  "\copy csv_data FROM 'games.csv' WITH (FORMAT csv, HEADER true)"
$PSQL "INSERT INTO TEAMS (NAME)  
SELECT DISTINCT(A.name) from (SELECT winner AS NAME FROM CSV_DATA UNION SELECT opponent AS NAME FROM csv_data) as A
"

$PSQL "INSERT INTO games (year, round,winner_id, opponent_id, winner_goals,opponent_goals)  
Select year,round,(Select team_id from teams where name = winner), (Select team_id from teams where name = opponent),
winner_goals,opponent_goals from csv_data
"