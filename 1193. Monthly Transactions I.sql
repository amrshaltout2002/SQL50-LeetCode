select to_char(trans_date, 'YYYY-MM') as month, country, count(state) trans_count,
        sum((state='approved')::int) approved_count, sum(amount) trans_total_amount,
        coalesce(sum(amount) filter(where state = 'approved'), 0) approved_total_amount
from transactions
group by to_char(trans_date, 'YYYY-MM'), country