-- new users per day
with day_of_first_use as (
  select
    u.ID,
    u2.day,
    min(u.day) as first_use
  from
    usage_hits u
    join usage_hits u2 on u2.ID = u.ID
  group by
    1,
    2
)
select
  day,
  count(distinct ID) as new_users
from
  day_of_first_use
where
  day = first_use
group by
  1
