-- Write a solution to find the people who have the most friends and the most friends number.
-- The test cases are generated so that only one person has the most friends.


select requester_id as id,count(requester_id) as num
from(
select requester_id 
from RequestAccepted
union all
select accepter_id   as requester_id
from RequestAccepted
) as c
group by 1
order by 2 desc 
limit 1
