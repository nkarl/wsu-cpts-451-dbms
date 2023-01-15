--1.	Find the distinct courses that ‘SYS’ track students in 'CptS' major are enrolled in. Return the courseno and credits for those courses. Return results sorted based on courseno. 
SELECT distinct C.courseno, C.credits
FROM Course C, Enroll E, Student S
WHERE C.courseno = E.courseno AND E.sID = S.sID 
   AND S.major='CptS' AND S.trackcode = 'SYS'
   ORDER BY courseno;
   
--2.	Find the sorted names, ids, majors and track codes of the students who are enrolled in more than 18 credits (19 or above). 
SELECT S.sName,S.sID,S.major, S.trackcode, SUM(credits)
FROM Course C, Enroll E, Student S
WHERE C.courseno = E.courseno AND E.sID = S.sid 
GROUP BY S.sID
HAVING SUM(credits)>18
ORDER BY S.sName,S.sID;

OR 

SELECT sName,STudent.sID,major, trackcode, Temp.totCredits
FROM Student, 
  ( SELECT E.sID, SUM(credits) as totCredits
  FROM Course C, Enroll E
  WHERE C.courseno = E.courseno 
  GROUP BY E.sID
  HAVING SUM(credits)>18 ) as Temp
WHERE Temp.sID = Student.sid 
ORDER BY Student.sname,Temp.sID;

     
	
Select * from prereq order by courseno

Prereq.courseno 
--3.	Find the courses that only 'SE' track  students in 'CptS major have been enrolled in. Give an answer without using the set EXCEPT operator.
SELECT distinct courseno 
FROM Student S1, Enroll E1
WHERE S1.sid = E1.sid AND S1.trackcode='SE' AND S1.major='CptS' 
AND E1.courseno NOT IN 
  ( SELECT courseno
    FROM Student S2, Enroll E2
    WHERE S2.sid = E2.sid AND S2.trackcode<>'SE'  )

--4.	Find the students who have enrolled in the courses that Diane enrolled and earned the same grade Diane earned in those courses. Return the student name, sID, major as well as the courseno and grade of the courses they have taken.  
SELECT S2.sname, S2.sid, S2.major, E2.courseno,E2.grade
FROM Student S1, Enroll E1, Student S2, Enroll E2
WHERE S1.sname='Diane' AND S1.sid=E1.sid AND E1.courseno=E2.courseno AND S2.sid=E2.sid AND E1.grade=E2.grade 
     AND S1.sid<> S2.sid
ORDER BY S2.sname
--5.	Find the students in 'CptS' major who are not enrolled in any classes. Return their name, sID, and major. (Note: Give a solution using outer join)

SELECT sname, Student.sid 
FROM Student LEFT OUTER JOIN Enroll ON Student.sid = Enroll.sid
WHERE major='CptS' AND courseno IS NULL
ORDER BY sname

SELECT sname, sid, major 
FROM student
WHERE major='CptS' AND sid NOT IN 
(SELECT sid FROM Enroll)
ORDER BY sname

--6.	Find the courses given in the ‘Sloan’ building which have enrolled more students than their enrollment limit. Return the courseno, enroll_limit, and the actual enrollment for those courses 
SELECT distinct C.courseno, enroll_limit, enrollnum
FROM Course as C, 
     (SELECT courseno,COUNT(sid) as enrollNum
      FROM Enroll as E
      GROUP BY courseno ) as Temp
WHERE C.classroom LIKE  'Sloan%' AND C.courseno = Temp.courseno AND C.enroll_limit < Temp.enrollNum

SELECT *
FROM Course as C
WHERE C.classroom LIKE  'Sloan%'  AND enroll_limit < 
     (SELECT COUNT(sid)
      FROM Enroll as E
      WHERE E.courseno = C.courseno) 


--7.	Find 'CptS' major students who enrolled in a course for which there exists a prerequisite that the student has not passed with grade “2”. (For example,Alice (sid: 12583589) was enrolled in CptS355 but had a grade 1.75 in CptS223.)  Return the names and sIDs of those students and the courseno of the course (i.e., the course whose prereq had a low grade).
SELECT distinct S.sname,E1.sid, E1.courseno
FROM Enroll as E1, Student S
WHERE S.major='CptS' AND E1.sid=S.sid 
AND 
  EXISTS 
	(SELECT *
	 FROM Enroll E2, Prereq as P
	  WHERE E2.courseNo = P.preCourseNo AND E1.courseno = P.courseno AND E1.sid=E2.sid
	     AND E2.grade<2 )

	  
--8.	For each 'CptS' course, find the percentage of the students who failed the course. Assume a passing grade is 2 or above. (Note: Assume students who didn’t earn a grade in class should be excluded in average calculation). 
SELECT T1.courseno,T2.passCount*100/T1.allCount
FROM
( SELECT courseno, COUNT(*) as allCount
  FROM Enroll
  WHERE grade IS NOT NULL and courseno LIKE 'CptS%'
  GROUP BY courseno ) as T1,
( SELECT courseno, COUNT(*) as passCount
  FROM Enroll
  WHERE grade IS NOT NULL AND courseno LIKE 'CptS%' AND grade >=2
  GROUP BY courseno ) as T2
 WHERE T1.courseno = T2.courseno


--9. 
--i. The query finds the courseno, credits, enroll_limit, and classroom for all courses which have at least 2 prerequisites. 
--It returns courseno AND the number of prereqs for those courses. 

--ii Corresponding SQL is as follows:
SELECT C.courseno, COUNT(distinct preCourseNo)
FROM Course C, Prereq P
WHERE C.courseno=P.courseno 
GROUP BY C.courseno
HAVING COUNT(distinct preCourseNo)>=2

