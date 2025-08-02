select s.user_id, ROUND(
        count(c.user_id) filter (where c.action = 'confirmed')::decimal 
        / 
        coalesce(nullif(count(c.user_id), 0), 1), 
    2) as confirmation_rate
from signups s
left join confirmations c
on s.user_id = c.user_id
group by s.user_id