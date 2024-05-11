-- Write a solution to:
-- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
-- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

(select u.name as results
from MovieRating m
join Users u
on m.user_id = u.user_id
group by m.user_id
order by count(m.movie_id) desc,u.name
limit 1)
union all
(select o.title as results
from MovieRating m
join Movies o
on m.movie_id = o.movie_id
where year(created_at) = '2020' and month(created_at) = '02'
group by m.movie_id
order by avg(rating) desc, o.title
limit 1)
