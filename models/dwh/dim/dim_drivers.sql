<<<<<<< HEAD
WITH
  year AS (
  SELECT
    DISTINCT d.id_driver,
    CAST(MIN(season_year) AS INT) AS debut_year,
    CAST(MAX(season_year)AS INT) AS last_year
  FROM
    {{ ref('stg_drivers')}} AS d
  INNER JOIN
    {{ ref('stg_results')}} AS r
=======
WITH year AS(
    SELECT
    DISTINCT d.id_driver,
    MIN(season_year) AS debut_year,
    MAX(season_year) AS last_year
  FROM
    {{ref('stg_drivers')}} AS d
  INNER JOIN
    {{ref('stg_results')}} AS r
>>>>>>> ff01b25b44614005e9d97c4030e506711933b3e0
  ON
    d.id_driver = r.id_driver
  INNER JOIN
    {{ ref('stg_races')}} AS ra
  ON
    r.id_race = ra.id_race
<<<<<<< HEAD
  GROUP BY
    1 ),
  wins AS(
  SELECT
    id_driver,
    COUNT(*) AS wins
  FROM
    {{ ref('stg_results')}}
  WHERE
    final_rank = '1'
  GROUP BY
    1 ),
  podiums AS(
SELECT
  id_driver,
  COUNT(*) AS podiums
FROM
  {{ ref('stg_results')}}
WHERE
  final_rank IN ('1','2','3')
GROUP BY
  1 ),

gp_finish AS(
 SELECT
  id_driver,
  COUNT(*) AS gp_finish
FROM
  {{ ref('stg_results')}}
GROUP BY
  1 ),

pole_position AS(
  SELECT
  id_driver, 
  COUNT(*) AS pole_position
FROM
  {{ ref('stg_qualifying')}}
WHERE
  final_position = 1
GROUP BY 1)
=======
    GROUP BY 1
)
>>>>>>> ff01b25b44614005e9d97c4030e506711933b3e0


SELECT
  d.id_driver,
<<<<<<< HEAD
  d.nationality,
  d.birth_date,
  dy.debut_year,
  dy.last_year,
  dy.last_year - dy.debut_year AS nb_seasons_raced,
  CONCAT(d.first_name, " ", d.last_name) AS driver_name,
  COALESCE(w.wins,0) AS win,
  COALESCE(p.podiums,0) AS podium,
  COALESCE(gp.gp_finish) AS gp_finish,
  COALESCE(pp.pole_position,0) AS pole_position
FROM
  {{ ref('stg_drivers')}} AS d
LEFT JOIN
  year AS dy
ON
  d.id_driver = dy.id_driver
LEFT JOIN
  wins AS w
ON
  d.id_driver = w.id_driver
LEFT JOIN 
  podiums AS p
ON
  d.id_driver = p.id_driver
LEFT JOIN
  gp_finish AS gp
ON
  d.id_driver = gp.id_driver
LEFT JOIN 
  pole_position AS pp
ON
  d.id_driver = pp.id_driver
ORDER BY d.id_driver
=======
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
>>>>>>> ff01b25b44614005e9d97c4030e506711933b3e0
