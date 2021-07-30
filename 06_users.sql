-- users per day
select
  day,
  count(distinct ID)
from
  usage_hits
group by
  1;
