#docker exec -it cpts-451-database psql -U postgres -c "CREATE DATABASE yelpdb;"
docker exec -it cpts-451-database psql yelpdb postgres -f "/database/CharlesNguyen_relations_v2.sql"
