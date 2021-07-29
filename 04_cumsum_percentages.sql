-- cumsum percentage of hits per person
with cumsums as (
  select
    p.name,
    u.day,
    u.hits,
    sum(u.hits) over (
      partition by u.ID
      order by
        u.day
    ) as cumsum
  from
    usage_hits u
    join persons p on p.ID = u.ID
  order by
    1,
    2
),
max_cumsums as (
  select
    name,
    max(cumsum) as max_cumsum
  from
    cumsums
  group by
    name
)
select
  c.name,
  day,
  hits,
  cumsum,
  round(cumsum / max_cumsum * 100) as percentage
from
  cumsums c
  join max_cumsums mc on mc.name = c.name
