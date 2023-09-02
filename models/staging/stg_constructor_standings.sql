{{ config(
    cluster_by = "id_constructor_standings",
) }}

SELECT
  CAST(constructorStandingsId AS STRING) AS id_constructor_standings
  , CAST(raceid AS STRING) AS id_race
  , CAST(constructorid AS STRING) AS id_constructor
  , points AS points_gained
  , position AS end_position
  , wins AS wins_number
FROM {{ source('Source_files','constructor_standings') }}