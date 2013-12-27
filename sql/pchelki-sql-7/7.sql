with licz as
( select 0 x
  union all select x + 1
  from licz
  where x < 9
)
, jed as
( select
	l1.x x1,
	l2.x x2,
	l3.x x3,
	(l1.x + l2.x + l3.x) / 10 as jed10 
  from licz l1, licz l2, licz l3
  where
	l1.x <> l2.x and
	l1.x <> l3.x and
	l2.x <> l3.x
	and
	(l1.x + l2.x + l3.x) % 10 = 0
	and
	(l1.x < l2.x and l2.x < l3.x)
) 
, dzie as
( select
	jed.x1 jx1,
	jed.x2 jx2,
	jed.x3 jx3,
	l1.x dx1,
	l2.x dx2,
	l3.x dx3,
	(jed10 + l1.x + l2.x + l3.x) / 10 as dzie10 
  from licz l1, licz l2, licz l3, jed
  where
	l1.x <> l2.x and
	l1.x <> l3.x and
	l2.x <> l3.x
	and
	l1.x not in (jed.x1, jed.x2, jed.x3) and
	l2.x not in (jed.x1, jed.x2, jed.x3) and
	l3.x not in (jed.x1, jed.x2, jed.x3)
    and 
	10 - ((l1.x + l2.x + l3.x) % 10) = jed10
  )
 , setki as (
  select
	l1.x sx1,
	l2.x sx2,
	l3.x sx3,
	dzie.dx1,
	dzie.dx2,
	dzie.dx3,
	dzie.jx1,
	dzie.jx2,
	dzie.jx3
  from licz l1, licz l2, licz l3, dzie
  where
	l1.x <> l2.x and
	l1.x <> l3.x and
	l2.x <> l3.x
	and
	0 not in (l1.x, l2.x, l3.x)
	and
	l1.x not in (dzie.dx1, dzie.dx2, dzie.dx3, dzie.jx1, dzie.jx2, dzie.jx3) and
	l2.x not in (dzie.dx1, dzie.dx2, dzie.dx3, dzie.jx1, dzie.jx2, dzie.jx3) and
	l3.x not in (dzie.dx1, dzie.dx2, dzie.dx3, dzie.jx1, dzie.jx2, dzie.jx3)
	and
	10-((l1.x+l2.x+l3.x) % 10) = dzie10
)
select
	sx1 * 100 + dx1 * 10 + jx1 l1,
	sx2 * 100 + dx2 * 10 + jx2 l2,
	sx3 * 100 + dx3 * 10 + jx3 l3
from setki
where sx1 * 100 + dx1 * 10 + jx1 + sx2 * 100 + dx2 * 10 + jx2 + sx3 * 100 + dx3 * 10 + jx3 = 1000;