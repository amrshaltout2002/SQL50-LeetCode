with grouped_date as (
    select visited_on, sum(amount) amount
    from customer
    group by visited_on
),
wanted_amounts as (
    select visited_on, sum(amount) over(order by visited_on rows between 6 preceding and current row) amount, round(avg(amount) over(order by visited_on rows between 6 preceding and current row), 2) average_amount
    from grouped_date
)

select * from wanted_amounts
offset 6 rows