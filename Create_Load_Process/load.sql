COPY airline
FROM 'C:\Users\Public\airlines.csv'
CSV HEADER;

COPY airport(airport_id, airport_name, origin_state)
FROM 'C:\Users\Public\airports.csv'
CSV HEADER

COPY wildlife
FROM 'C:\Users\Public\wildlife.csv'
CSV HEADER

COPY aircraftdetails
FROM 'C:\Users\Public\aircraft.csv'
CSV HEADER

COPY aircraftairlinebridge
FROM 'C:\Users\Public\airlineaircraftbridge.csv'
CSV HEADER

COPY aircraftairportbridge
FROM 'C:\Users\Public\aircraftairportbridge.csv'
CSV HEADER

COPY birdstrikedetails
FROM 'C:\Users\Public\bridstrikes.csv'
CSV HEADER

COPY precipitation
FROM 'C:\Users\Public\precipitation.csv'
CSV HEADER


