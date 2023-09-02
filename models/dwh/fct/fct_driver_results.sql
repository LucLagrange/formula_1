SELECT
    re.id_result
    , re.id_race
    , re.id_driver
<<<<<<< HEAD
    , ra.id_circuit
    , re.final_rank
    , d.driver_name
=======
    , re.final_rank
    , d.driver_name
    , ra.id_circuit
>>>>>>> dfe924a9e462c65299ffc1695ef6291d0e9347a8
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