docker exec -it cpts-451-database psql yelpdb -U postgres -c "SELECT * FROM business;"
docker exec -it cpts-451-database psql yelpdb -U postgres -c "SELECT * FROM review;"
docker exec -it cpts-451-database psql yelpdb -U postgres -c "SELECT * FROM checkin;"
