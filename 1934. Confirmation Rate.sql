-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages
-- is 0. Round the confirmation rate to two decimal places.
-- Write a solution to find the confirmation rate of each user.
-- Return the result table in any order.


select s.user_id,
round(avg(case when c.action = 'confirmed' then 1 else 0 end),2) as confirmation_rate
from signups s
left join Confirmations c
on s.user_id = c.user_id
group by s.user_id;
