with name as (
    select name, m.user_id, count(m.user_id) cnt
    from movierating m
    join users u on m.user_id = u.user_id
    group by m.user_id, name
    order by cnt desc, name asc
    limit 1
),
title as (
    select title, mr.movie_id, avg(rating) average
    from MovieRating mr
    join movies m on mr.movie_id = m.movie_id
    where created_at between '2020-02-01' and '2020-02-29'
    group by mr.movie_id, title
    order by average desc, title asc
    limit 1
)

select name results from name
union all select title results from title