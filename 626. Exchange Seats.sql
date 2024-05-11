-- Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped. Return the result table ordered by id in ascending order.
-- The result format is in the following example.

select 
case when id = (select max(id) from seat) and id % 2 =1
        then id
    when id % 2 = 1
        then id +1
    else
         id -1
    end as id, student
from Seat
order by 1
