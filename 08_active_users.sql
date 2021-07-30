-- active users per day
-- e.g. hits > 2
-- if null return 0 users
with active_users_per_day as (
  select
    day,
    count(distinct ID) as count_users
  from
    usage_hits
  where
    hits > 2
  group by
    1
),
days as (
  select
    distinct day
  from
    usage_hits
)
select
  d.day,
  coalesce(a.count_users, 0) as active_users
from
  days d
  left outer join active_users_per_day a on a.day = d.day
