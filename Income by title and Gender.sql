--Find the average total compensation based on employee titles and gender. Total compensation is calculated by adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees without bonuses in your calculation. 
--Output the employee title, gender (i.e., sex), along with the average total compensation.


select distinct e.employee_title,avg(e.salary+b.bonus) as avg_Salary,e.sex
from sf_employee e
inner join sf_bonus b on b.worker_ref_id=e.id
group by e.employee_title,e.sex
;