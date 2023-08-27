WITH nb_races AS (
    SELECT
        id_circuit
        , COUNT(*) AS nb_races
        , MIN(season_year) AS oldest_race_year
        , MAX(season_year) AS latest_race_year
    FROM
        {{ ref('stg_races') }}
    GROUP BY 1
)

, last_winner AS (
    SELECT
        id_circuit
        , driver_name
    FROM
        {{ ref('fct_race_wins') }}
    WHERE victory_order_circuit = 1
)

, distinct_winners AS (
    SELECT
        id_circuit
        , COUNT(DISTINCT id_driver) AS nb_distinct_winners
    FROM
        {{ ref('fct_race_wins') }}
    GROUP BY 1
)


SELECT
    c.id_circuit
    , c.circuit_name
    , c.circuit_location
    , c.circuit_country
    , lw.driver_name AS last_winner
    , dw.nb_distinct_winners
    , r.nb_races
    , r.oldest_race_year
    , r.latest_race_year
FROM {{ ref('stg_circuits') }} AS c
LEFT JOIN
    nb_races AS r
    ON c.id_circuit = r.id_circuit
LEFT JOIN
    last_winner AS lw
    ON c.id_circuit = lw.id_circuit
LEFT JOIN
    distinct_winners AS dw
    ON c.id_circuit = dw.id_circuit
ORDER BY CAST(id_circuit AS INT)
