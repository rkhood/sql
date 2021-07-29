-- cumsum of hits per person
select
  p.name,
  u.day,
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
  2;
