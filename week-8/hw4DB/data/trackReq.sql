DROP TABLE IF EXISTS TrackRequirements; 

CREATE TABLE TrackRequirements (
	major  VARCHAR(7),
	trackcode   VARCHAR(10),
	courseNo  VARCHAR(7),
	PRIMARY KEY (major,trackcode,courseNo),
	FOREIGN KEY (major,trackcode) REFERENCES Tracks(major,trackcode),
	FOREIGN KEY (courseNo) REFERENCES Course(courseNo)
);


INSERT INTO TrackRequirements (major,trackcode,courseNo) VALUES 
												  ('CptS','SE','CptS121'),
												  ('CptS','SE','CptS122'),	
												  ('CptS','SE','CptS223'),	
												  ('CptS','SE','CptS260'),	
												  ('CptS','SE','CptS322'),	
												  ('CptS','SE','CptS355'),	
												  ('CptS','SE','CptS421'),	
												  ('CptS','SE','CptS423'),	
												  ('CptS','SE','CptS317'),	
												  ('CptS','SE','CptS360'),
												  ('CptS','SE','CptS323'),	
												  ('CptS','SE','CptS451'),
												  ('CptS','SE','CptS422'),
  												  ('CptS','SYS','CptS460'),	
												  ('CptS','SYS','CptS451'),
												  ('CptS','SYS','CptS464'),
												  ('CptS','SYS','CptS466'),
												  ('CptS','SYS','CptS121'),
												  ('CptS','SYS','CptS122'),	
												  ('CptS','SYS','CptS223'),	
												  ('CptS','SYS','CptS260'),	
												  ('CptS','SYS','CptS322'),	
												  ('CptS','SYS','CptS355'),	
												  ('CptS','SYS','CptS421'),	
												  ('CptS','SYS','CptS423'),	
												  ('CptS','SYS','CptS317'),	
												  ('CptS','SYS','CptS360'),
  												  ('CptS','G','CptS460'),	
												  ('CptS','G','CptS451'),
												  ('CptS','G','CptS422'),
												  ('CptS','G','CptS443'),
											      ('CptS','G','CptS121'),
												  ('CptS','G','CptS122'),	
												  ('CptS','G','CptS223'),	
												  ('CptS','G','CptS260'),	
												  ('CptS','G','CptS322'),	
												  ('CptS','G','CptS355'),	
												  ('CptS','G','CptS421'),	
												  ('CptS','G','CptS423'),	
												  ('CptS','G','CptS317'),	
												  ('CptS','G','CptS360'),
												  ('EE','ME','EE214'),
												  ('EE','ME','EE234'),
												  ('EE','ME','EE261'),
												  ('EE','ME','EE262'),
												  ('EE','ME','EE311'),												  
												  ('EE','ME','EE321'),
												  ('EE','ME','EE331'),
												  ('EE','ME','EE334'),												  
												  ('EE','ME','EE341'),
												  ('EE','ME','EE351'),  
												  ('EE','ME','EE415'),  												  
												  ('EE','ME','EE416'),  												  
												  ('EE','ME','EE431'),
												  ('EE','ME','EE451'),
												  ('EE','ME','EE483'),
												  ('EE','ME','EE476'),
												  ('EE','ME','EE499'),
												  ('EE','POW','EE214'),
												  ('EE','POW','EE234'),
												  ('EE','POW','EE261'),
												  ('EE','POW','EE262'),
												  ('EE','POW','EE311'),												  
												  ('EE','POW','EE321'),  
												  ('EE','POW','EE331'),
												  ('EE','POW','EE334'),												  
												  ('EE','POW','EE341'), 
												  ('EE','POW','EE351'), 
												  ('EE','POW','EE415'), 												  
												  ('EE','POW','EE416'), 												  
												  ('EE','POW','EE361'),
												  ('EE','POW','EE362'),
												  ('EE','POW','EE483'),
												  ('EE','POW','EE476'),
												  ('EE','POW','EE499');
