DROP TABLE IF ExISTS precipitation;

DROP TABLE IF ExISTS birdStrikeDetails;

DROP TABLE IF EXISTS aircraftAirportBridge;

DROP TABLE IF EXISTS aircraftAirlineBridge;

DROP TABLE IF EXISTS aircraftDetails;

DROP TABLE IF EXISTS wildlife;

DROP TABLE IF EXISTS airport;

DROP TABLE IF EXISTS airline;

CREATE TABLE  airline  (
   airline_id  int NOT NULL,
   airline_name  varchar(45) DEFAULT NULL ,
  PRIMARY KEY ( airline_id ),
  UNIQUE(airline_name)
);

CREATE TABLE airport (
  airport_id INT NOT NULL,
  airport_name VARCHAR(45) DEFAULT NULL,
 origin_state VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (airport_id),
  UNIQUE(airport_name));

create type sizeTypes as enum('Small','Medium','Large');

CREATE TABLE wildlife (
  wildlife_id INT NOT NULL,
  wildlife_species VARCHAR(45) DEFAULT NULL,
  wildlife_size sizeTypes DEFAULT NULL,
  PRIMARY KEY (wildlife_id));

--create type aircraftTypes as enum('Airplane');

CREATE TABLE  aircraftDetails  (
   aircraft_model  varchar(45) NOT NULL,
   engines  int DEFAULT NULL,
   aircraft_type  aircraftTypes DEFAULT NULL,
  PRIMARY KEY ( aircraft_model )
);

CREATE TABLE  aircraftAirlineBridge  (
   aircraft_id  int NOT NULL,
   airline_id  int,
   aircraft_model  varchar(45) NOT NULL,
  PRIMARY KEY ( aircraft_id ),
  CONSTRAINT  airline_fk  FOREIGN KEY ( airline_id ) REFERENCES
   airline ( airline_id )  ,
  CONSTRAINT  model_fk  FOREIGN KEY ( aircraft_model ) REFERENCES
   aircraftDetails  ( aircraft_model ) 
);

CREATE TABLE  aircraftAirportBridge  (
   record_id  int NOT NULL,
   aircraft_id  int,
   airport_id  int,
  PRIMARY KEY( record_id ),
  CONSTRAINT  aircraft_fk  FOREIGN KEY ( aircraft_id ) REFERENCES
   aircraftAirlineBridge  ( aircraft_id ),
  CONSTRAINT  airport_fk  FOREIGN KEY ( airport_id ) REFERENCES  airport 
  ( airport_id )  
);

--create type effect_impact_types as enum('Aborted Take-off','Engine Shut Down',
--  'Precautionary Landing','Other','None');
  
--create type effect_damage_types as enum('No damage', 'Cause damage');
--create type phase_of_flight_types as enum('Approach','Climb','Descent',
--  'Landing Roll','Parked','Take-off run','Taxi');
--create type condition_sky_types as enum('No Cloud','Overcast','Some Cloud');

CREATE TABLE IF NOT EXISTS  birdStrikeDetails  (
   record_id  int NOT NULL,
   altitude  int DEFAULT NULL,
   wildlife_struck_actual  int DEFAULT NULL,
   effect_impact  effect_impact_types DEFAULT NULL,
   effect_damage  effect_damage_types DEFAULT NULL,
   flight_date  date DEFAULT NULL,
   phase_of_flight  phase_of_flight_types DEFAULT NULL,
   conditions_sky  condition_sky_types DEFAULT NULL,
   remains_collected  int DEFAULT NULL,
   remains_sent  int DEFAULT NULL,
   remarks  text DEFAULT NULL,
   wildlife_id  int DEFAULT NULL,
   warning  int DEFAULT NULL,
   cost  int DEFAULT NULL,
   injuries  int DEFAULT NULL,
  PRIMARY KEY ( record_id ),
  
  CONSTRAINT  record_fk  FOREIGN KEY ( record_id ) REFERENCES
   aircraftAirportBridge  ( record_id ),
  
  CONSTRAINT  wildlife_fk  FOREIGN KEY ( wildlife_id ) REFERENCES
   wildlife  ( wildlife_id ));
   
   
   
create type prec_types as enum('Fog', 'Rain', 'Snow', 'None');

CREATE TABLE IF NOT EXISTS precipitation (
record_id INT NOT NULL,
precipitation_type prec_types NOT NULL
DEFAULT 'None',
PRIMARY KEY (record_id, precipitation_type),
CONSTRAINT record_precep_fk FOREIGN KEY (record_id) REFERENCES
birdstrikedetails (record_id) ON DELETE CASCADE ON UPDATE CASCADE
);

  



