DROP TABLE IF EXISTS Course;

CREATE TABLE Course (
	courseNo        VARCHAR(7),
	credits         INTEGER NOT NULL,
	enroll_limit    INTEGER,
	classroom       VARCHAR(10),
	PRIMARY KEY(courseNo)
);																  

INSERT INTO Course(courseNo,credits,enroll_limit,classroom) VALUES('CptS121',4,24,'Sloan175'),
																  ('CptS122',4,25,'Sloan175'),
																  ('CptS223',3,25,'Sloan150'),
																  ('CptS260',3,3,'Sloan150'),
																  ('CptS322',3,20,'Sloan169'),
																  ('CptS323',3,19,'Sloan169'),
																  ('CptS355',3,22,'Sloan223'),
																  ('CptS421',3,15,'Sloan223'),
																  ('CptS423',3,15,'Sloan221'),
																  ('CptS360',3,22,'Sloan175'),
																  ('CptS460',3,22,'Sloan169'),
																  ('CptS451',3,10,'Sloan7'),
																  ('CptS422',3,15,'Sloan150'),
																  ('CptS317',3,20,'Sloan9'),
																  ('CptS443',3,10,'Sloan9'),
																  ('CptS484',3,25,'Sloan150'),
																  ('CptS487',3,35,'Sloan150'),
																  ('CptS464',3,5,'Sloan9'),
																  ('CptS466',3,2,'Sloan7'),
																  ('CptS471',3,3,'Sloan7'),
																  ('EE214',3,25,'Sloan175'),
																  ('EE221',2,30,'Sloan175'),
																  ('EE234',3,15,'Sloan175'),
																  ('EE261',3,15,'Sloan169'),
																  ('EE262',3,15,'Sloan169'),
																  ('EE304',3,10,'Sloan150'),
																  ('EE311',3,10,'Sloan150'),
																  ('EE321',3,10,'Sloan9'),
																  ('EE331',3,12,'Sloan9'),
																  ('EE334',3,12,'Sloan9'),
																  ('EE341',3,10,'Sloan7'),
																  ('EE351',3,2,'EME128'),
																  ('EE361',3,9,'EME120'),
																  ('EE362',3,9,'EME56'),
																  ('EE415',2,15,'EME52'),
																  ('EE416',3,2,'EME52'),
																  ('EE431',3,5,'EME56'),
																  ('EE451',3,5,'EME128'),
																  ('EE483',3,5,'EME128'),
																  ('EE476',3,5,'EME128'),
																  ('EE499',3,2,'EME56'),
																  ('MATH101',3,30,'CUE101'),
																  ('MATH103',3,25,'CUE202'),
																  ('MATH105',3,15,'CUE201'),
																  ('MATH106',3,10,'CUE202'),
																  ('MATH108',3,10,'CUE101'),
																  ('MATH115',3,10,'CUE102'),
																  ('MATH140',3,10,'CUE107'),
																  ('MATH171',4,10,'CUE207'),
																  ('MATH172',4,10,'CUE102'),
																  ('MATH205',3,10,'CUE101'),
																  ('MATH212',3,10,'CUE203'),
																  ('MATH216',3,10,'CUE101'),
																  ('MATH220',3,10,'CUE105'),
																  ('MATH230',3,10,'CUE201'),
																  ('MATH251',3,4,'CUE202'),
																  ('MATH273',3,10,'CUE204'),
																  ('MATH283',3,10,'CUE205'),
																  ('MATH301',3,10,'CUE102'),
																  ('CE211',3,5,'Sloan150'),
																  ('CE215',3,5,'Sloan169'),
																  ('CE317',3,5,'Sloan150'),
																  ('CE322',3,5,'Sloan7'),
																  ('CE330',3,5,'Sloan9'),
																  ('CE341',3,5,'Sloan9'),
																  ('CE351',3,5,'Sloan7'),
																  ('CE401',3,5,'Sloan9'),
																  ('CE403',3,5,'Sloan9'),
																  ('CE405',3,5,'Sloan9'),
																  ('CE414',3,5,'Sloan9'),
																  ('CE416',3,5,'Sloan7'),
																  ('CE417',3,5,'Sloan7'),
																  ('ME116',3,8,'Sloan7'),
																  ('ME212',3,8,'Sloan7'),
																  ('ME216',3,8,'Sloan7'),
																  ('ME220',3,8,'Sloan32'),
																  ('ME301',3,8,'Sloan33'),
																  ('ME303',3,8,'Sloan32'),
																  ('ME305',3,8,'Sloan7'),
																  ('ME310',3,8,'Sloan9'),
																  ('ME311',3,8,'Sloan7'),
																  ('ME313',3,8,'Sloan7'),
																  ('ME316',3,8,'Sloan7'),
																  ('ME348',3,8,'Sloan7'),
																  ('ME401',3,8,'Sloan150'),
																  ('ME402',3,8,'Sloan150'),
																  ('ME431',3,8,'Sloan169'),
																  ('ME439',3,8,'Sloan9'),
																  ('ME474',3,8,'Sloan9'),
																  ('ME495',3,8,'Sloan9'),
																  ('ME499',3,8,'Sloan9'),
																  ('CHE110',3,4,'Sloan32'),
																  ('CHE211',3,4,'Sloan33'),
																  ('CHE321',3,4,'Sloan32'),
																  ('CHE334',3,5,'Sloan32'),
																  ('CHE398',3,5,'Sloan32'),
																  ('CHE433',3,5,'Sloan32'),
																  ('CHE451',3,5,'Sloan32'),
																  ('CHE476',3,5,'Sloan32'),
																  ('CHE495',3,5,'Sloan32'),
																  ('CHE498',3,5,'Sloan32');

