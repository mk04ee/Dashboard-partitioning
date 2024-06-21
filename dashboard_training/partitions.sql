CREATE TABLE DASHBOARD.sensor_temperature PARTITION OF DASHBOARD.sensor_data  FOR VALUES IN 
('Temperature'); 

CREATE TABLE DASHBOARD.humidity PARTITION OF DASHBOARD.sensor_data  FOR VALUES IN 
('Humidity'); 

CREATE TABLE DASHBOARD.sensor_light_level PARTITION OF DASHBOARD.sensor_data  FOR VALUES IN 
('Light Level');

CREATE TABLE DASHBOARD.sensor_noise_level PARTITION OF DASHBOARD.sensor_data  FOR VALUES IN 
('Noise Level');


