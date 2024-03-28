-- There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a
-- process.The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the 
-- machine divided by the number of processes that were run.

select machine_id, round(avg(processing_time),3) as processing_time
from(
select a1.machine_id as machine_id,a1.process_id, a2.timestamp - a1.timestamp as processing_time
from Activity a1
join Activity a2
on a1.machine_id  = a2.machine_id and a1.process_id = a2.process_id and a1.timestamp < a2.timestamp)
as c
group by 1; 	
