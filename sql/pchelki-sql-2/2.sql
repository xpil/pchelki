with

mn as
(select
3 as n union select 4 union select 5

union select 6 union select 7 union select 8

union select 9 union select 10 union select 20

union select 21 union select 24)

, komb
as (select mn1.n n1, mn2.n n2, mn3.n n3,

mn4.n n4, mn5.n n5, mn6.n n6,

mn7.n n7, mn8.n n8, mn9.n n9,

mn10.n n10, mn11.n n11

from mn mn1, mn mn2, mn mn3,

mn mn4, mn mn5, mn mn6,

mn mn7, mn mn8, mn mn9,

mn mn10, mn mn11)

select *

from komb

where

n1<>n2

and n1<>n3 and n2<>n3

and n1<>n4 and n2<>n4 and n3<>n4

and n1<>n5 and n2<>n5 and n3<>n5 and n4<>n5

and n1<>n6 and n2<>n6 and n3<>n6 and n4<>n6 and n5<>n6

and n1<>n7 and n2<>n7 and n3<>n7 and n4<>n7 and n5<>n7 and n6<>n7

and n1<>n8 and n2<>n8 and n3<>n8 and n4<>n8 and n5<>n8 and n6<>n8 and n7<>n8

and n1<>n9 and n2<>n9 and n3<>n9 and n4<>n9 and n5<>n9 and n6<>n9 and n7<>n9 and n8<>n9

and n1<>n10 and n2<>n10 and n3<>n10 and n4<>n10 and n5<>n10 and n6<>n10 and n7<>n10 and n8<>n10 and n9<>n10

and n1<>n11 and n2<>n11 and n3<>n11 and n4<>n11 and n5<>n11 and n6<>n11 and n7<>n11 and n8<>n11 and n9<>n11 and n10<>n11

and n1+n2+n3+2+12=65

and n4+n5+n6+25+13=65

and n7+n8+22+14+17=65

and n9+n10+n11+15+23=65

and n1+n4+n9+18+14=65

and n2+n7+n10+19+13=65

and n5+n8+n11+16+12=65

and n3+n6+11+17+23=65

and n1+n8+1+13+23=65;