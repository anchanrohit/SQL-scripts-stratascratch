--Find the titles of workers that earn the highest salary. Output the highest-paid title or multiple titles that share the highest salary.

select t.worker_title,w.salary
from worker w
left join title t on t.worker_ref_id=w.worker_id
where salary=(select max(salary) from worker)
order by w.salary desc;