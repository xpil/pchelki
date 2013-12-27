WITH fb as (
  SELECT  1 n, CAST(0 as bigint) f, CAST(1 as bigint) f1
  UNION ALL
  SELECT  n + 1, f + f1 f, f f1 FROM fb WHERE n < 93
)
SELECT  n, f FROM fb;