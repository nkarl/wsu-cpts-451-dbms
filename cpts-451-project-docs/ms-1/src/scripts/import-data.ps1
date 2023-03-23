docker exec -it test_db psql business_db postgres -c "CREATE DATABASE my_db;"
docker exec -it test_db psql business_db postgres -c "CREATE TABLE IF NOT EXISTS business (name VARCHAR(80), state VARCHAR (2), city VARCHAR (50)); COPY business (name, state, city) FROM '/data/business.csv' DELIMITER ',' CSV;"
