-- 1
SELECT  *
FROM
    TrackRequirements   AS TR,
    course              AS C
WHERE
    trackcode='SYS'
    AND C.courseno=TR.courseno;

SELECT
    C.courseno,
    C.credits
FROM
    TrackRequirements   AS TR,
    course              AS C
WHERE
    trackcode='SYS'
    AND C.courseno=TR.courseno
ORDER BY C.courseno;

-- 2
SELECT *
FROM
    Student AS S,
    (SELECT DISTINCT *
        FROM
            course AS C,
            enroll AS E
        WHERE
            C.courseno=E.courseno) AS A
WHERE
    A.sid=S.sid;

SELECT
    S.sid,
    S.sname,
    S.major,
    S.trackcode,
    SUM(credits)
FROM
    Student AS S,
    (SELECT DISTINCT *
        FROM
            course AS C,
            enroll AS E WHERE C.courseno=E.courseno) AS A
WHERE
    A.sid=S.sid
GROUP BY
    S.sid
HAVING SUM(credits)> 18
ORDER BY S.sname;

-- 3
SELECT DISTINCT
    courseno
FROM
    student AS S,
    Enroll  AS E
WHERE
    S.sid=E.sid
    AND trackcode='SE'
    AND courseno LIKE 'CptS%';

-- 4
SELECT *
FROM
    enroll AS e1,
    (SELECT DISTINCT *
        FROM
            student AS s,
            enroll AS e
        WHERE
            s.sname='Diane'
            AND s.sid=e.sid) AS Diane
WHERE
    e1.grade=Diane.grade;

SELECT DISTINCT
    se1.sid,
    se1.sname,
    se1.major,
    se1.courseno,
    se1.grade
FROM
    (SELECT DISTINCT
        s1.sid, sname, major, courseno, grade
        FROM
            student AS s1,
            enroll AS e1
        WHERE
            s1.sid=e1.sid) AS se1,
    (SELECT DISTINCT *
        FROM
            student AS s,
            enroll AS e
        WHERE
            s.sname='Diane'
            AND s.sid=e.sid)
    AS Diane
    WHERE se1.grade=Diane.grade
        AND se1.sname<>Diane.sname;

-- 5
SELECT DISTINCT
    S.sname,
    S.sid
FROM
    (SELECT *
        FROM
            student
        WHERE
            major LIKE 'CptS') AS S
FULL OUTER JOIN
    Enroll AS E
ON
    E.sid=S.sid
    AND courseno=NULL
WHERE
    S.sname IS NOT NULL;

-- 6
-- Find the courses given in the ‘Sloan’ building, which
--      have enrolled more students than their enrollment limit.
-- Return the courseno, enroll_limit, and the actual enrollment for those courses.
SELECT C2.courseno, C3.enroll_limit, C2.enrollnum FROM (
    SELECT
        C1.courseno,
        COUNT(C1.sid) AS enrollnum
    FROM (SELECT DISTINCT
            C.courseno,
            E.sid
            FROM
                course AS C,
                enroll AS E
            WHERE
                classroom LIKE 'Sloan%'
                AND C.courseno=E.courseno) AS C1
            GROUP BY C1.courseno) AS C2
    JOIN course C3
    ON C3.courseno=C2.courseno
    WHERE C2.enrollnum>C3.enroll_limit;

