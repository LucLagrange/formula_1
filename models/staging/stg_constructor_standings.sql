{{ config(
    cluster_by = "id_constructor_standings",
) }}

SELECT
  CAST(constructorStandingsId AS STRING) AS id_constructor_standings
  , CAST(raceid AS STRING) AS id_race
  , CAST(constructorid AS STRING) AS id_constructor
  , SAFE_CAST(points AS INT) AS points_gained
  , SAFE_CAST(position AS INT) AS end_position
  , SAFE_CAST(wins AS INT) AS wins_number
FROM {{ source('Source_files','constructor_standings') }}