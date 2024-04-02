-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that 
-- logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

--Preferred
SELECT ROUND(SUM(login)/COUNT(DISTINCT player_id), 2) AS fraction
FROM (
  SELECT
    player_id,
    DATEDIFF(event_date, MIN(event_date) OVER(PARTITION BY player_id)) = 1 AS login
  FROM Activity
) AS t

-- Method 2
select round(count(distinct player_id)/(select count(distinct player_id) from activity), 2) as fraction
from activity
where (player_id, date_sub(event_date, interval 1 day)) 
in (select player_id, min(event_date) as first_date
from activity
group by player_id)

-- Method 3  
SELECT ROUND(COUNT(A2.player_id) / COUNT(A1.player_id), 2) 
As fraction FROM Activity A1 LEFT OUTER JOIN Activity A2 ON 
A2.player_id = A1.player_id AND A2.event_date = A1.event_date + 1 
WHERE (A1.player_id, A1.event_date) IN (SELECT player_id, 
MIN(event_date) FROM Activity GROUP BY player_id )



