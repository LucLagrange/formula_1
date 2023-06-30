{{ config(
    materialized='table',
    cluster_by = "id_status",
) }}

SELECT
    cast(statusid AS STRING) AS id_status
    , status
FROM
    `formula-1-391319.Formula1.status`
