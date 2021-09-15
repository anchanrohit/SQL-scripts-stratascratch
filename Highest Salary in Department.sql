--Find the employee with the highest salary per department.
--Output the department name, employee's first name along with the corresponding salary.

with rnkquery as 
(
select department,first_name,salary,
rank() over (partition by department order by salary desc) as rnk 
from employee
)
select department,first_name,salary
from rnkquery
where rnk=1
;