-- longest consecutive streak
-- some users have more than one streak, e.g.:

-- INSERT INTO
--   usage_hits (ID, day, hits)
-- VALUES
--   (1, "2021-01-05", 3),
--   (1, "2021-01-06", 6),
--   (1, "2021-01-07", 9),
--   (1, "2021-01-08", 2);

-- DELETE FROM usage_hits WHERE day >= "2021-01-05" ;

with lags as (
  select
    ID,
    day,
    lag(day) over (
      partition by ID
      order by
        day
    ) as lag_day
  from
    usage_hits
  order by
    1
),
find_breaks as (
  select
    *,
    case
      when datediff(day, lag_day) > 1 then 1
      else 0
    end as breaks
  from
    lags
  order by
    ID,
    day
),
group_streaks as (
  select
    *,
    sum(breaks) over (
      partition by ID
      order by
        day
    ) as grouped
  from
    find_breaks
),
streaks as (
  select
    ID,
    count(1) as streak
  from
    group_streaks
  group by
    ID,
    grouped
)
select
  ID,
  max(streak) as longest_streak
from
  streaks
group by
  ID
