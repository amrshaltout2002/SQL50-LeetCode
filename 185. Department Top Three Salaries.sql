with unique_salary as (
    select name, departmentId, salary,
            dense_rank() over(partition by departmentId order by salary desc) salary_rnk
    from employee
)

select d.name Department, us.name Employee, Salary
from unique_salary us
join department d
on us.departmentId = d.id
where us.salary_rnk <= 3