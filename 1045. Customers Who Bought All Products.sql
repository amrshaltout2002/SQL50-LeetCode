with cte as (
    select customer_id, count(distinct c.product_key) cnt
    from customer c
    join product p
    on c.product_key = p.product_key
    group by customer_id
)

select customer_id
from cte
where cnt = (select count(product_key) from product)