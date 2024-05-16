-- There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.
-- Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.

select person_name
from
(
select person_name,turn, sum(weight) over (order by turn) as total
from Queue
order by turn
) as c
where total <= 1000
order by turn desc 
limit 1
