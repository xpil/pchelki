with q as

(select convert(char(1), ‘a’) as litera

union all select

convert(char(1), char(ascii(litera)+1))

from q

where ascii(litera)<ascii(‘z’))

, litery as (

select litera from q

union all select ‘ż’

union all select ‘ź’

union all select ‘ć’

union all select ‘ń’

union all select ‘ą’

union all select ‘ś’

union all select ‘ł’

union all select ‘ę’

union all select ‘ó’

)

select top 1000

litera

, slowo

, len(slowo) - len(replace(slowo, litera, ”)) as licznik

from

litery

, words

order by 3 desc