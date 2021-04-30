SELECT
EXTRACT(YEAR FROM flight_date) AS year,
COUNT(*) AS num_of_strikes
FROM
birdstrikedetails
GROUP BY
year;
