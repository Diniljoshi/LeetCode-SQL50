-- Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
-- The result format is in the following example.

select Id
from Weather w1
join Weather w2
on datediff(w1.recordDate, w2.recordDate) = -1
where w2.temperature > w1.temperature;
