select
    cast(circuitid as string) as id_circuit,
    circuitref as circuit_reference,
    name as circuit_name,
    location as circuit_location,
    country as circuit_country,
    lat as lattitude,
    lng as longitude,
    alt as altitude
from `formula-1-391319.Formula1.circuits`
