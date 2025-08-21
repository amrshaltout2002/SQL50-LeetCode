with cte as (
    select person_id, person_name, weight, turn,
            sum(weight) OVER (ORDER BY turn) as total
    from queue
    order by turn
)

select person_name
from cte
where total <= 1000
order by total desc
limit 1