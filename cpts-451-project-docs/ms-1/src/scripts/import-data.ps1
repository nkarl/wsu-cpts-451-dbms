docker exec -it cs451pg psql business_db admin -c "CREATE DATABASE business_db;"
docker exec -it cs451pg psql business_db admin -c "CREATE TABLE IF NOT EXISTS business (name VARCHAR(80), state VARCHAR (2), city VARCHAR (50)); COPY business (name, state, city) FROM '/data/business.csv' DELIMITER ',' CSV;"
