docker exec -it '451-HW4' psql HW4DB postgres -c "CREATE DATABASE HW4;"
docker exec -it '451-HW4' psql HW4DB postgres -a -f /data/course.sql
docker exec -it '451-HW4' psql HW4DB postgres -a -f /data/student.sql
docker exec -it '451-HW4' psql HW4DB postgres -a -f /data/prereq.sql
docker exec -it '451-HW4' psql HW4DB postgres -a -f /data/tracks.sql
docker exec -it '451-HW4' psql HW4DB postgres -a -f /data/trackReq.sql
docker exec -it '451-HW4' psql HW4DB postgres -a -f /data/enroll.sql
