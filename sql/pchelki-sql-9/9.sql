with p1 as (
select 2 as p
union all select 3
union all select 5
union all select 7
union all select 11
union all select 13
union all select 17
union all select 19
union all select 23
union all select 29
union all select 31)
, num10 as (
select 0 as n
union all select n+1
from num10
where n<9)
, num1000 as (
select n1.n + 10*n2.n + 100*n3.n n
from num10 n1, num10 n2, num10 n3)
, np1000 as (
select n
from num1000, p1
where n%p = 0
and N>=P*P)
select *
from num1000
where n not in
(select n
from np1000)
and n>1
order by 1;