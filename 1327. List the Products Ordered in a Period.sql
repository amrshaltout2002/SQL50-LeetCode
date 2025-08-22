with sum_products as (
    select product_id, sum(unit) unit
    from orders
    where order_date between '2020-02-01' and '2020-02-29'
    group by product_id
)

select product_name, sp.unit unit
from products p
join sum_products sp
on p.product_id = sp.product_id
where sp.unit >= 100