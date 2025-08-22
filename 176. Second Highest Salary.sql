with cte as (
    select salary, dense_rank() over(order by salary desc) rnk
    from employee
)

select salary SecondHighestSalary
from (
    select salary from cte
    where rnk = 2
    union all select null
)
limit 1