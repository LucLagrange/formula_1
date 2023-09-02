{{ config(
    cluster_by = "id_race",
) }}


SELECT
    cast(raceid AS STRING) AS id_race
    , CAST(year AS STRING) AS season_year
    , SAFE_CAST(round AS INT) AS season_round
    , cast(circuitid AS STRING) AS id_circuit
    , name AS race_name
    , CASE WHEN CAST(date AS STRING) LIKE '%N' THEN NULL ELSE date END AS race_date
    , CASE WHEN CAST(quali_date AS STRING) LIKE '%N' THEN NULL ELSE quali_date END AS qualifying_date
    , CASE WHEN CAST(sprint_date AS STRING) LIKE '%N' THEN NULL ELSE sprint_date END AS sprint_date
    , CASE WHEN CAST(fp1_date AS STRING) LIKE '%N' THEN NULL ELSE fp1_date END AS fp1_date
    , CASE WHEN CAST(fp2_date AS STRING) LIKE '%N' THEN NULL ELSE fp2_date END AS fp2_date
    , CASE WHEN CAST(fp3_date AS STRING) LIKE '%N' THEN NULL ELSE fp3_date END AS fp3_date
FROM {{ source('Source_files','races') }}
