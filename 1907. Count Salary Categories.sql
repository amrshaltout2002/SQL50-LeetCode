with low as (
    select 'Low Salary' category ,count(account_id) accounts_count
    from accounts
    where income < 20000
),
average as (
    select 'Average Salary' category ,count(account_id) accounts_count
    from accounts
    where income between 20000 and 50000
),
high as (
    select 'High Salary' category ,count(account_id) accounts_count
    from accounts
    where income > 50000
)

select category, accounts_count from low
union select category, accounts_count from average
union select category, accounts_count from high
