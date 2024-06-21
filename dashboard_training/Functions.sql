CREATE OR REPLACE FUNCTION DASHBOARD.GET_RANDOM_NUMBER(start_val INTEGER, end_val INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN floor(random() * (end_val - start_val + 1) + start_val);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION DASHBOARD.notify_new_sensor_data()
RETURNS TRIGGER AS $$
DECLARE
    new_data JSON;
BEGIN
    new_data = json_build_object(
        'DataID', NEW.DataID,
        'SensorID', NEW.SensorID,
        'Timestamp', NEW.Timestamp,
        'Value', NEW.Value,
        'Unit', NEW.Unit
    );

    perform pg_notify('new_sensor_data', new_data::TEXT);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sensor_data_trigger
AFTER INSERT ON transactions.sensorData
FOR EACH ROW
EXECUTE FUNCTION notify_new_sensor_data();