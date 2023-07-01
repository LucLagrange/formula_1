{{ config(
    materialized='table',
    cluster_by = "id_constructor",
) }}

SELECT
    constructorref AS constructor_reference
    , name AS constructor_name
    , nationality
    , CAST(constructorid AS STRING) AS id_constructor
FROM
    `formula-1-391319.Formula1.constructors`
