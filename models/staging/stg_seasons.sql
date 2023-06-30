{{ config(
    materialized='table',
    cluster_by = "season_year",
) }}

SELECT
    url AS wikipedia_url
    , CAST(`year` AS STRING) AS season_year
FROM
    `formula-1-391319.Formula1.seasons`
