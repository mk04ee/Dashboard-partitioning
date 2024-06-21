CREATE SCHEMA IF NOT EXISTS DASHBOARD;

CREATE TABLE IF NOT EXISTS DASHBOARD.facility(
	id serial primary key,
	name varchar(50),
	address varchar(150),
	latitude real,
	longitude real,
	contact_no bigint,
  	email_id varchar(256)
);

CREATE TABLE IF NOT EXISTS DASHBOARD.building
(
    building_id integer PRIMARY KEY,
    name varchar(50),
    address varchar(100) ,
    facility_id int references DASHBOARD.facility(id)
);

Create table IF NOT EXISTS DASHBOARD.floor
(
  floor_id integer NOT NULL,
  name character varying(50) COLLATE pg_catalog."default" NOT NULL,
  building_id integer NOT NULL references DASHBOARD.building(building_id),
  CONSTRAINT floor_pkey PRIMARY KEY (floor_id)
);


CREATE TABLE IF NOT EXISTS DASHBOARD.company
(
company_id serial PRIMARY KEY,
name varchar(50) NOT NULL,
floor_id integer NOT NULL references DASHBOARD.floor(floor_id)
);


CREATE TABLE IF NOT EXISTS DASHBOARD.zone(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    FLOOR_ID INT REFERENCES DASHBOARD.FLOOR(FLOOR_ID)
);

CREATE TABLE IF NOT EXISTS DASHBOARD.category(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    DESCRIPTION TEXT
);

CREATE TABLE IF NOT EXISTS DASHBOARD.sensor(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    CATEGORY_ID INT REFERENCES DASHBOARD.category(id),
    ZONE_ID INT REFERENCES DASHBOARD.zone(id)
);

CREATE TABLE IF NOT EXISTS DASHBOARD.sensor_data(
    VALUE REAL,
    RECEIVED_TIME TIMESTAMP,
    SENSOR_ID INT
) PARTITION BY LIST (SENSOR_ID);

CREATE TABLE IF NOT EXISTS DASHBOARD.REPORTS(
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(50),
    IS_REAL_TIME BOOLEAN,
    QUERY_INTERVAL TEXT,
    START_TIME TIMESTAMP,
    END_TIME TIMESTAMP,
    FLOOR_ID INT REFERENCES DASHBOARD.floor(floor_id)
);




