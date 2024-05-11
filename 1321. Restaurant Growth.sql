-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).Compute the moving average of how much the customer paid in a seven days window 
-- (i.e., current day + 6 days before). average_amount should be rounded to two decimal places. Return the result table ordered by visited_on in ascending order. The result format is in the following example.

--Best Solution
SELECT visited_on, amount, ROUND(amount/7, 2) average_amount
FROM (
    SELECT visited_on, 
    SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY   PRECEDING AND CURRENT ROW) amount, 
  --- or can be written ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    FROM Customer
) t
WHERE visited_on>= (select min(visited_on) from customer)+6;

-- Alternative

with days as (
select visited_on, sum(amount) as amount
from customer
group by visited_on
)

select c1.visited_on, sum(c2.amount) as amount, round(avg(c2.amount),2) as average_amount

from days c1
join days c2
on c2.visited_on <= c1.visited_on and datediff(c1.visited_on,c2.visited_on) < 7
group by c1.visited_on
having count(*) = 7
order by visited_on 

-- Method 2

SELECT
    visited_on,
    (
        SELECT SUM(amount)
        FROM customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM customer
            WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ),
        2
    ) AS average_amount
FROM customer c
WHERE visited_on >= (
        SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
        FROM customer
    )
GROUP BY visited_on;

-- Method 3

WITH last_6_days AS (
    SELECT DISTINCT visited_on
    FROM Customer
    ORDER BY visited_on ASC
    OFFSET 6
)

SELECT c1.visited_on,
        SUM(c2.amount) AS amount,
        ROUND(SUM(c2.amount) / 7., 2)  AS average_amount
FROM last_6_days AS c1
INNER JOIN Customer AS c2
ON c2.visited_on BETWEEN c1.visited_on - 6 AND c1.visited_on
GROUP BY c1.visited_on;
