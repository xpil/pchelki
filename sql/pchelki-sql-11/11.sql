WITH ludzie AS (
  SELECT 1 AS ID, 'Jan Kowalski' AS nazwa, 'm' AS plec, 190 AS wzrost FROM dual
  UNION ALL SELECT 2, 'Adam Malinowski', 'm', 180 FROM dual
  UNION ALL SELECT 3, 'Andrzej Nowak', 'm', 170 FROM dual
  UNION ALL SELECT 4, 'Gerard Słabszy', 'm', 190 FROM dual
  UNION ALL SELECT 5, 'Eliza Bębenek', 'k', 160 FROM dual
  UNION ALL SELECT 6, 'Kora Śliska', 'k', 195 FROM dual
  UNION ALL SELECT 7, 'Juanita Guadalajara-Pieniążek', 'k', 170 FROM dual
)
SELECT
    id,
    nazwa,
    plec,
    wzrost,
    DENSE_RANK() OVER(ORDER BY wzrost DESC) ranking_1,
    RANK() OVER(ORDER BY wzrost DESC) ranking_2,
    DENSE_RANK() OVER(PARTITION BY PLEC ORDER BY wzrost DESC) ranking_3,
    RANK() OVER(PARTITION BY PLEC ORDER BY WZROST DESC) ranking_4,
    ROW_NUMBER() over(order by wzrost desc) lista_1,
    ROW_NUMBER() over(partition by plec order by wzrost desc) lista_2,
    NTILE(2) over(order by wzrost desc) dwupodzial,
    NTILE(3) over(order by WZROST desc) trojpodzial,
    plec || NTILE(2) over(PARTITION BY PLEC order by WZROST desc) dwupodzial_w_grupach
  FROM
    ludzie;