CREATE FUNCTION [dbo].[literki_po_kolei] (@s nvarchar(15))
RETURNS bit
AS
BEGIN
  declare @i int
  set @i=1
  while @i<=len(@s)-1
  begin
    if SUBSTRING(@s, @i, 1) >= substring(@s, @i+1, 1)
      return 0
    set @i=@i+1
  end
  return 1
END

CREATE FUNCTION [dbo].[literki_odwrotnie] (@s nvarchar(15))
RETURNS bit
AS
BEGIN
  declare @i int
  set @i=1
  while @i<=len(@s)-1
  begin
    if SUBSTRING(@s, @i, 1)<=substring(@s, @i+1, 1)
      return 0
    set @i=@i+1
  end
  return 1
END

select slowo, len(slowo) dlugosc
from slowa
where dbo.literki_po_kolei(slowo)=1
order by len(slowo) desc;

select slowo, len(slowo) dlugosc
from slowa
where dbo.literki_odwrotnie(slowo)=1
order by len(slowo) desc;