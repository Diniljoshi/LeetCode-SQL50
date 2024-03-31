-- Write a solution to find the number of times each student attended each exam.
-- Return the result table ordered by student_id and subject_name.
-- The result format is in the following example.

select s.student_id, s.student_name, sb.subject_name, count(e.subject_name) as attended_exams
from Students s
cross join Subjects sb
left join examinations e
on sb.subject_name = e.subject_name and s.student_id = e.student_id
group by 1,2,3
order by 1,2;
