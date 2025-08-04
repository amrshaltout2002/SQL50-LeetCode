select query_name, round(avg(rating*1.0/position), 2) quality,
        round(((count(rating) filter(where rating < 3))*1.0 / count(rating))*100,2) poor_query_percentage
from queries
group by query_name

