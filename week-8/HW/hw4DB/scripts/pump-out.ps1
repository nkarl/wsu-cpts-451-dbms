docker exec -it 451-HW4 psql HW4DB postgres -c "SELECT * FROM Course LIMIT 10;" > .\out\course.txt
docker exec -it 451-HW4 psql HW4DB postgres -c "SELECT * FROM Tracks LIMIT 10;" > .\out\tracks.txt
docker exec -it 451-HW4 psql HW4DB postgres -c "SELECT * FROM Student LIMIT 10;" > .\out\student.txt
docker exec -it 451-HW4 psql HW4DB postgres -c "SELECT * FROM Enroll LIMIT 10;" > .\out\enroll.txt
docker exec -it 451-HW4 psql HW4DB postgres -c "SELECT * FROM Prereq LIMIT 10;" > .\out\prereq.txt
docker exec -it 451-HW4 psql HW4DB postgres -c "SELECT * FROM TrackRequirements LIMIT 10;" > .\out\req.txt
