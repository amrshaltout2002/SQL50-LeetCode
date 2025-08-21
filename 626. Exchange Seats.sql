WITH odd AS (
    SELECT id - 1 AS id, student
    FROM seat
    WHERE id % 2 = 0
    order by id
),
even AS (
    SELECT id + 1 AS id, student
    FROM seat
    WHERE id % 2 != 0
    order by id
)
select row_number() over(order by id) id, student
from (
    select id, student from odd
    union select id, student from even
)