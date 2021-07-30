-- rank hits per day per user
select
  ranked.*
from
  (
    SELECT
      usage_hits.*,
      rank() OVER (
        PARTITION BY day
        ORDER BY
          hits DESC
      )
    FROM
      usage_hits
  ) ranked
