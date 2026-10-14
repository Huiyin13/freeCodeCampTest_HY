#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals+opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals),2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT AVG(winner_goals+opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT max(goals) FROM (Select winner_goals as goals, winner_id as id from games 
union Select opponent_goals as goals, opponent_id as id from games)  AS all_goals
 ")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT count(*) FROM games g where g.winner_goals>2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM games g inner join teams t on t.team_id = g.winner_id where g.round='Final' and year=2018")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT distinct(name) from (
Select * from games inner join teams t on winner_id = t.team_id 
where round ='Eighth-Final' and year=2014
union
Select * from games inner join teams y on opponent_id = y.team_id
where round ='Eighth-Final' and year=2014
)as a order by name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "Select distinct(name) from games inner join teams t on winner_id = t.team_id order by name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "Select year, name from games inner join teams t on winner_id = t.team_id where round='Final' order by year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "Select  name from games inner join teams t on winner_id = t.team_id where name like 'Co%' order by name")"
