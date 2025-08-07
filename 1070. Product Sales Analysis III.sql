with cte as (
    select product_id, year, quantity, price, dense_rank() over(partition by product_id order by year) rnk
    from sales
)

select distinct cte.product_id, cte.year first_year, cte.quantity, cte.price
from sales s
join cte on s.product_id = cte.product_id
where cte.rnk = 1