docker exec -it cpts-451-database psql -U postgres -c "CREATE DATABASE milestone1db;"
docker exec -it cpts-451-database psql milestone1db postgres -c "CREATE TABLE IF NOT EXISTS business (name VARCHAR(80), state VARCHAR (2), city VARCHAR (50)); COPY business (name, state, city) FROM '/database/mi-01/milestone1DB.csv' DELIMITER ',' CSV;"
