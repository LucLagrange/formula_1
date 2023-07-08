WITH nb_races AS(
  SELECT
    id_circuit,
    COUNT(*) AS nb_races,
    MIN(season_year) AS oldest_race_year,
    MAX(season_year) AS latest_race_year,
  FROM
    {{ref('stg_races')}}
  GROUP BY 1
),

last_winner AS(
  SELECT
id_circuit
, driver_name
FROM
(
  SELECT
re.id_result
, re.id_race
, re.id_driver
, d.driver_name
, ra.id_circuit
, ra.season_year
, re.final_rank
, ROW_NUMBER() OVER(PARTITION BY ra.id_circuit ORDER BY ra.season_year DESC) AS row_number
FROM
  `Formula1_staging.stg_results` AS re
LEFT JOIN
  {{ref('stg_races')}} AS ra ON 
    re.id_race = ra.id_race
LEFT JOIN 
  {{ ref('dim_drivers')}} AS d ON 
  re.id_driver = d.id_driver
WHERE
  final_rank = '1')
WHERE row_number = 1

)

SELECT 
  c.id_circuit
  , c.circuit_name
  , c.circuit_location
  , c.circuit_country
  , lw.driver_name AS last_winner
  , r.nb_races
  , r.oldest_race_year
  , r.latest_race_year
  , CAST(r.latest_race_year AS INT) - CAST(r.oldest_race_year AS INT) +1 AS nb_years_on_calendar 
FROM {{ref('stg_circuits')}} AS c
LEFT JOIN 
  nb_races AS r ON c.id_circuit = r.id_circuit
LEFT JOIN
  last_winner AS lw ON c.id_circuit = lw.id_circuit
ORDER BY CAST(id_circuit AS INT)