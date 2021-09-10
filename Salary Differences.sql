--Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the difference in salaries.

select 
(select max(e.salary) 
from db_dept d 
inner join db_employee e on e.department_id=d.id
group by d.department
having d.department ='marketing')
-
(select max(e.salary) 
from db_dept d 
inner join db_employee e on e.department_id=d.id
group by d.department
having d.department ='engineering') as diff
;