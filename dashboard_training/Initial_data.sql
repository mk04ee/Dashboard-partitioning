-- facility data
insert into DASHBOARD.facility(name, address, latitude, longitude, contact_no, email_id)
values
('Community centre', '123 park ave, white field', 12.7548, 77.54564, 458454879, 'contact@cummnitycentre.com'),
( 'Health care', '45 street', 12.23454, 76.5545, 4571111547, 'info@gmail.com');

-- building data
Insert into DASHBOARD.building(building_id,name, address, facility_id) values 
(1, 'Building 1', 'white field, bangalore', 
(select id from  DASHBOARD.facility where name = 'Community centre'));

Insert into DASHBOARD.building(building_id,name, address, facility_id) values (2, 'Building 2', 'white field, bangalore', 2);


-- floor data
Insert into DASHBOARD.floor(floor_id, name, building_id) values (1, 'Floor 1', 1);
Insert into DASHBOARD.floor(floor_id, name, building_id) values (2, 'Floor 2', 2);


-- company data
Insert into DASHBOARD.company(name, floor_id) values ( 'Company 1', 1);
Insert into DASHBOARD.company(name, floor_id) values ('Company 2', 2);
Insert into DASHBOARD.company( name, floor_id) values ('Company 2', 1);

-- zone data
Insert into DASHBOARD.zone(name, floor_id) values ('Zone 1', 1);
Insert into DASHBOARD.zone(name, floor_id) values ('Zone 2', 1);
Insert into DASHBOARD.zone(name, floor_id) values ('Zone 3', 2);
Insert into DASHBOARD.zone(name, floor_id) values ('Zone 4', 2);


-- category data
INSERT INTO DASHBOARD.category (name, description)
VALUES ('Temperature', 'Monitors room temperature in degrees Celsius');

INSERT INTO DASHBOARD.category (name, description)
VALUES ('Humidity', 'Monitors air humidity percentage');

INSERT INTO DASHBOARD.category (name, description)
VALUES ('Light Level', 'Measures light intensity in Lux');

INSERT INTO DASHBOARD.category (name, description)
VALUES ('Noise Level', 'Measures noise level in decibels');


-- sensors
INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Fridge Temperature Sensor', 1, 2);  

INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Server Room Temperature Sensor', 1, 4); 

INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Humidifier Sensor', 2, 2);  

INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Warehouse Humidity Sensor', 2, 5);  

INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Desk Lamp Light Sensor', 3, 1); 

INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Meeting Room Light Sensor', 3, 3);  

INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Street Noise Sensor', 4, 1);  

INSERT INTO DASHBOARD.sensor (name, category_id, zone_id)
VALUES ('Break Room Noise Sensor', 4, 3);  


-- sensor data
INSERT INTO DASHBOARD.sensor_data (value, received_time, sensor_id, category)
SELECT
    DASHBOARD.GET_RANDOM_NUMBER(15,30),
    generate_series('2024-01-01 00:00:00'::timestamp, '2024-05-01 23:59:00'::timestamp, '30 seconds'),
    DASHBOARD.GET_RANDOM_NUMBER(1,8),
    random_string(ARRAY['Temperature', 'Humidity', 'Light Level', 'Noise Level']);