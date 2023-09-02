SELECT
    re.id_result
    , re.id_race
    , re.id_driver
    , ra.id_circuit
    , re.final_rank
    , d.driver_name
    , ra.season_year
    , ra.season_round
FROM
    {{ref('stg_results')}} AS re
LEFT JOIN
    {{ ref('stg_races') }} AS ra
    ON
        re.id_race = ra.id_race
LEFT JOIN
    {{ ref('dim_drivers') }} AS d
    ON
        re.id_driver = d.id_driver
WHERE id_result !="resultId"