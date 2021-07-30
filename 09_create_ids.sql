-- create IDs
-- useful for groupings when IDs are not ints
select
  *,
  dense_rank() over(
    order by
      ID
  ) as generated_id
from
  usage_hits
