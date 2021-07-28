-- query usage with some conditions
select
  u.id,
  SUBSTRING_INDEX(p.name, '-', -1) as name -- clean up name
,
  sum(u.hits) as sum_val
from
  usage_hits u
  inner join persons p on p.id = u.id
where
  u.day between '2020-01-01'
  and '2021-01-02'
  and p.id not like '%999%' -- remove bad characters
  and p.id not in (
    select
      id
    from
      deactivate
  ) -- id cannot be in this table
group by
  1,
  2
order by
  3 desc
