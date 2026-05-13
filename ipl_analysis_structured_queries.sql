-- IPL DATA ANALYTICS PROJECT


-- DATABSE SETUP 
USE ipl_analysis;


-- DATA CLEANING
SET SQL_SAFE_UPDATES = 0;

UPDATE matches SET team1 = 'Delhi Capitals' WHERE team1 = 'Delhi Daredevils';
UPDATE matches SET team2 = 'Delhi Capitals' WHERE team2 = 'Delhi Daredevils';
UPDATE matches SET toss_winner = 'Delhi Capitals' WHERE toss_winner = 'Delhi Daredevils';
UPDATE matches SET winner = 'Delhi Capitals' WHERE winner = 'Delhi Daredevils';
UPDATE deliveries SET batting_team = 'Delhi Capitals' WHERE batting_team = 'Delhi Daredevils';
UPDATE deliveries SET bowling_team = 'Delhi Capitals' WHERE bowling_team = 'Delhi Daredevils';

UPDATE matches SET team1 = 'Punjab Kings' WHERE team1 = 'Kings XI Punjab';
UPDATE matches SET team2 = 'Punjab Kings' WHERE team2 = 'Kings XI Punjab';
UPDATE matches SET toss_winner = 'Punjab Kings' WHERE toss_winner = 'Kings XI Punjab';
UPDATE matches SET winner = 'Punjab Kings' WHERE winner = 'Kings XI Punjab';
UPDATE deliveries SET batting_team = 'Punjab Kings' WHERE batting_team = 'Kings XI Punjab';
UPDATE deliveries SET bowling_team = 'Punjab Kings' WHERE bowling_team = 'Kings XI Punjab';

UPDATE matches SET team1 = 'Royal Challengers Bengaluru' WHERE team1 = 'Royal Challengers Bangalore';
UPDATE matches SET team2 = 'Royal Challengers Bengaluru' WHERE team2 = 'Royal Challengers Bangalore';
UPDATE matches SET toss_winner = 'Royal Challengers Bengaluru' WHERE toss_winner = 'Royal Challengers Bangalore';
UPDATE matches SET winner = 'Royal Challengers Bengaluru' WHERE winner = 'Royal Challengers Bangalore';
UPDATE deliveries SET batting_team = 'Royal Challengers Bengaluru' WHERE batting_team = 'Royal Challengers Bangalore';
UPDATE deliveries SET bowling_team = 'Royal Challengers Bengaluru' WHERE bowling_team = 'Royal Challengers Bangalore';

UPDATE matches SET team1 = 'Rising Pune Supergiants' WHERE team1 = 'Rising Pune Supergiant';
UPDATE matches SET team2 = 'Rising Pune Supergiants' WHERE team2 = 'Rising Pune Supergiant';
UPDATE matches SET toss_winner = 'Rising Pune Supergiants' WHERE toss_winner = 'Rising Pune Supergiant';
UPDATE matches SET winner = 'Rising Pune Supergiants' WHERE winner = 'Rising Pune Supergiant';
UPDATE deliveries SET batting_team = 'Rising Pune Supergiants' WHERE batting_team = 'Rising Pune Supergiant';
UPDATE deliveries SET bowling_team = 'Rising Pune Supergiants' WHERE bowling_team = 'Rising Pune Supergiant';

UPDATE matches SET venue= 'Wankhede Stadium' WHERE venue='Wankhede Stadium, Mumbai';

SET SQL_SAFE_UPDATES = 1;


-- ANALYSIS QUERIES

-- MOST SUCCESSFUL TEAMS
SELECT winner , COUNT(*) AS most_successful_team FROM matches GROUP BY winner ORDER BY most_successful_team DESC;

-- MOST PLAYER OF THE MATCH AWARDS
SELECT player_of_match, COUNT(*) AS players_most_awards FROM matches GROUP BY player_of_match ORDER BY players_most_awards desc;

-- TOP RUN SCORER 
SELECT batter,SUM(batsman_runs) AS total_batsman_runs FROM deliveries GROUP BY batter ORDER BY total_batsman_runs DESC;

-- SIX HITTER
SELECT batter, COUNT(*) AS sixes FROM deliveries WHERE batsman_runs=6 GROUP BY batter ORDER BY sixes DESC;

-- MOST FOUR BY
SELECT batter, COUNT(*) AS fours FROM deliveries WHERE batsman_runs=4 GROUP BY batter order by fours DESC;

-- HIGHEST SCORE BY A TEAM 
SELECT batting_team,match_id,SUM(total_runs) AS total_score FROM deliveries GROUP BY batting_team,match_id ORDER BY total_score DESC;

-- Toss Decision Trends
SELECT toss_decision, COUNT(*) AS wins FROM matches WHERE toss_winner = winner GROUP BY toss_decision;

-- MOST USED VENUE
SELECT venue, COUNT(*) AS matches_played FROM matches GROUP BY venue ORDER BY matches_played DESC LIMIT 10;

-- Teams Winning Most Tosses
SELECT toss_winner,COUNT(*) AS most_toss_winner FROM matches GROUP BY toss_winner ORDER BY most_toss_winner DESC;

-- Most Successful Venues for Teams
SELECT venue,winner,COUNT(*) AS wins FROM matches GROUP BY venue, winner ORDER BY wins DESC;


-- JOIN QUERIES

-- Top Scorer in Each Season
SELECT m.season,d.batter, SUM(batsman_runs) AS runs_from_season FROM matches m JOIN deliveries d ON m.id=d.match_id GROUP BY m.season,d.batter ORDER BY m.season,runs_from_season DESC;

-- Best Venues for Batting
SELECT m.venue,AVG(d.total_runs) AS batting_venues FROM deliveries d JOIN matches m ON d.match_id=m.id group by m.venue ORDER BY batting_venues DESC;

-- Most Runs Against Teams
SELECT d.batter ,d.bowling_team,SUM(d.batsman_runs) AS runs FROM deliveries d GROUP BY d.batter,d.bowling_team ORDER BY runs DESC;