This repo is used for documenting how to build a complete web application system from scratch.

This system will have three components:
- Client Application (/app)
- Server API (/api)
- Database using PostgreSQL (/db)

All components are expected to be individually *dockerized*.

## Required software
---

- Docker
- NPM

## How to run the stack
---
1. Preparing the database:
- Prerequisite:
    - `milestone1b.csv` must be in `/db`
```sh
# unzip and at the root directory where docker-compose.yml can be found, run:
    docker compose up -d
    docker exec -it test_db psql business_db postgres -c "CREATE DATABASE my_db;"
    docker exec -it test_db psql business_db postgres -c "CREATE TABLE IF NOT EXISTS business (name VARCHAR(80), state VARCHAR (2), city VARCHAR (50)); COPY business (name, state, city) FROM '/data/business.csv' DELIMITER ',' CSV;"
```

2. Start the server:
```sh
    cd api
    npm install && npm run dev
    cd ..
```

3. Start the client:
```sh
    cd app
    npm install && npm run dev
```

## Expectations
---
### PostgreSQL Database

- The database (/db) is expected to be run in a docker container.
- A `docker-compose.yml` is present at the root of this repo for starting the dockerized databse.
- The database contains a sample csv data for business in some US states and cities.

### Server API

- The server (/api) is expected to make SQL query to the database via preset localhost and port, and then
- send result as JSON response to the client.

### Client App

- The client (/app) is expected to be able to display the response data as specified in the use cases in Milestone 1.
- Left panel:
    - A drop down list of states to select
    - A listbox containing city within that state
- Right panel:
    - A drop down list of cities (from previously selected state from the left panel) to select
    - A listbox containing businesses and their information

