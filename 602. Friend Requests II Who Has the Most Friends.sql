with cte1 as(
    select accepter_id id, count(accepter_id) num
    from RequestAccepted
    group by accepter_id
),
cte2 as(
    select requester_id id, count(requester_id) num
    from RequestAccepted
    group by requester_id
)

select id, sum(num) num
from (
    select id, num from cte1
    union all select id, num from cte2
)
group by id
order by num desc
limit 1