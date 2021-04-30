SELECT ar.airport_name AS airport_name,
count(*) AS number_strikes
FROM
airport ar
JOIN
aircraftAirportBridge aab
ON
ar.airport_id = aab.airport_id
JOIN
birdStrikeDetails br
ON
br.record_id = aab.record_id

GROUP BY
ar.airport_name