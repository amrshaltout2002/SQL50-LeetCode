select e1.employee_id, e1.department_id
from employee e1
join employee e2
on e1.employee_id = e2.employee_id
group by e1.employee_id, e1.department_id, e1.primary_flag
having count(e1.department_id) = 1 or e1.primary_flag = 'Y'