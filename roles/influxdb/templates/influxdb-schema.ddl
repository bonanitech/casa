-- Be careful, influxdb is very strict about quotes (at least that's been my experience)
-- usernames should have double quotes, passwords single quotes
CREATE USER "{{influxdb_admin_user}}" WITH PASSWORD '{{influxdb_admin_password}}' WITH ALL PRIVILEGES
CREATE USER "{{influxdb_homeassistant_user}}" WITH PASSWORD '{{influxdb_homeassistant_password}}'
CREATE USER "{{influxdb_grafana_user}}" WITH PASSWORD '{{influxdb_grafana_password}}'

CREATE DATABASE {{influxdb_homeassistant_db}}
GRANT ALL ON {{influxdb_homeassistant_db}} TO "{{influxdb_homeassistant_user}}"
GRANT ALL ON {{influxdb_homeassistant_db}} TO "{{influxdb_grafana_user}}"
-- Newline needed at the end for the last command to be executed, using this comment to ensure that