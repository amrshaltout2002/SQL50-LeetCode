with cte as (
    select delivery_id, customer_id, order_date, customer_pref_delivery_date,
        dense_rank() over (
            partition by customer_id
            order by order_date
        ) dense_rank_number

    from delivery
)

select round((sum((order_date = customer_pref_delivery_date)::int)/(count(*)*1.0))*100,2) immediate_percentage
from cte
where dense_rank_number = 1