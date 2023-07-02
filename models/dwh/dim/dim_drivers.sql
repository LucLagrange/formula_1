WITH year AS(
    SELECT
    DISTINCT d.id_driver,
    MIN(season_year) AS debut_year,
    MAX(season_year) AS last_year
  FROM
    {{ref('stg_drivers')}} AS d
  INNER JOIN
    {{ref('stg_results')}} AS r
  ON
    d.id_driver = r.id_driver
  INNER JOIN
    {{ ref('stg_races')}} AS ra
  ON
    r.id_race = ra.id_race
    GROUP BY 1
)


SELECT
  d.id_driver,
  CONCAT(d.first_name, " ", d.last_name) AS driver_name,
  d.nationality,
  d.birth_date,
  EXTRACT(YEAR
  FROM
    CURRENT_DATE) - EXTRACT(YEAR
  FROM
    d.birth_date) AS age,
    dy.debut_year,
    dy.last_year
FROM
  {{ ref("stg_drivers")}} AS d
LEFT JOIN
    year AS dy ON d.id_driver = dy.id_driver