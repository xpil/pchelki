WITH input AS
 ( SELECT 'wąchock' AS CITY, 1 as priorytet, 'grupa1' AS GRUPA FROM DUAL
 UNION ALL SELECT 'kozia wólka', 2, 'grupa1' FROM DUAL
 UNION ALL SELECT 'kołomyja', 3, 'grupa1' FROM DUAL
 UNION ALL SELECT 'mielec', 4, 'grupa1' FROM DUAL
 UNION ALL SELECT 'cichosze', 5, 'grupa1' FROM DUAL
 UNION ALL SELECT 'wilczyn', 2, 'grupa2' FROM DUAL
 UNION ALL SELECT 'piątek', 3, 'grupa2' FROM DUAL
 UNION ALL SELECT 'karczewo', 4, 'grupa2' FROM DUAL
 UNION ALL SELECT 'śmiechów', 5, 'grupa2' FROM DUAL
 UNION ALL SELECT 'kościeliska', 4, 'grupa3' FROM DUAL
 UNION ALL SELECT 'przybłędów', 5, 'grupa3' FROM DUAL
 )
 , T2 AS (
 SELECT 
 MIN(priorytet) AS priorytet,
 GRUPA FROM input GROUP BY GRUPA
 )
 , OUTPUT AS (
 SELECT 
 T2.GRUPA ,
 input.CITY 
 FROM 
 input, T2 
 where 
 INPUT.priorytet=T2.priorytet 
 AND input.GRUPA=T2.GRUPA

 )
 SELECT * FROM OUTPUT order by grupa;
 
 
 
 
 WITH input AS
 ( SELECT 'wąchock' AS CITY, 1 as priorytet, 'grupa1' AS GRUPA FROM DUAL
 UNION ALL SELECT 'kozia wólka', 2, 'grupa1' FROM DUAL
 UNION ALL SELECT 'kołomyja', 3, 'grupa1' FROM DUAL
 UNION ALL SELECT 'mielec', 4, 'grupa1' FROM DUAL
 UNION ALL SELECT 'cichosze', 5, 'grupa1' FROM DUAL
 UNION ALL SELECT 'wilczyn', 2, 'grupa2' FROM DUAL
 UNION ALL SELECT 'piątek', 3, 'grupa2' FROM DUAL
 UNION ALL SELECT 'karczewo', 4, 'grupa2' FROM DUAL
 UNION ALL SELECT 'śmiechów', 5, 'grupa2' FROM DUAL
 UNION ALL SELECT 'kościeliska', 4, 'grupa3' FROM DUAL
 UNION ALL SELECT 'przybłędów', 5, 'grupa3' FROM DUAL
 )
 , T2 AS (
 select distinct 
 GRUPA, 
 MIN(priorytet) OVER(PARTITION BY GRUPA ORDER BY priorytet) AS priorytet
 FROM INPUT
 )
 , OUTPUT AS (
 SELECT 
 T2.GRUPA ,
 input.CITY 
 FROM 
 input, T2 
 where 
 INPUT.priorytet=T2.priorytet 
 AND input.GRUPA=T2.GRUPA

 )
 SELECT * FROM OUTPUT ORDER BY GRUPA;
 
 
 
 
 
 WITH input AS
 ( SELECT 'wąchock' AS CITY, 1 as priorytet, 'grupa1' AS GRUPA FROM DUAL
 UNION ALL SELECT 'kozia wólka', 2, 'grupa1' FROM DUAL
 UNION ALL SELECT 'kołomyja', 3, 'grupa1' FROM DUAL
 UNION ALL SELECT 'mielec', 4, 'grupa1' FROM DUAL
 UNION ALL SELECT 'cichosze', 5, 'grupa1' FROM DUAL
 UNION ALL SELECT 'wilczyn', 2, 'grupa2' FROM DUAL
 UNION ALL SELECT 'piątek', 3, 'grupa2' FROM DUAL
 UNION ALL SELECT 'karczewo', 4, 'grupa2' FROM DUAL
 UNION ALL SELECT 'śmiechów', 5, 'grupa2' FROM DUAL
 UNION ALL SELECT 'kościeliska', 4, 'grupa3' FROM DUAL
 UNION ALL SELECT 'przybłędów', 5, 'grupa3' FROM DUAL
 )
SELECT 
 GRUPA, 
 COALESCE(
 MAX(CASE priorytet WHEN 1 THEN CITY END)
 , MAX(CASE priorytet WHEN 2 THEN CITY END)
 , MAX(CASE priorytet WHEN 3 THEN CITY END)
 , MAX(CASE priorytet WHEN 4 THEN CITY END)
 , MAX(CASE priorytet WHEN 5 THEN CITY END)
 ) as c1
FROM INPUT
GROUP BY GRUPA
ORDER BY GRUPA;