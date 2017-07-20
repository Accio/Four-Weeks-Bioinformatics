-- In command line
-- ml load SQLite
-- sqlite3 my-first-database.sqlite

-- drop table if exists
DROP TABLE IF EXISTS student;

-- create a table
CREATE TABLE student (id int PRIMARY KEY, given_name char, family_name char);

-- insert values
INSERT INTO student ('id', 'given_name', 'family_name') VALUES (1, 'Roland', 'Schmucki');
INSERT INTO student ('id', 'given_name', 'family_name') VALUES (2, 'Laura', 'Badi');
INSERT INTO student ('id', 'given_name', 'family_name') VALUES (3, 'David', 'Zhang');
INSERT INTO student ('id', 'given_name', 'family_name') VALUES (4, 'Martin', 'Ebeling');
INSERT INTO student ('id', 'given_name', 'family_name') VALUES (5, 'Martin', 'Strahm');

-- note that Unicode works as well in SQLite
INSERT INTO student ('id', 'given_name', 'family_name') VALUES (6, 'Verena', 'Küppers');

-- SELECT all records of student
SELECT * FROM student;
SELECT family_name FROM student WHERE given_name = 'Laura';
SELECT family_name FROM student WHERE given_name = 'Martin';
SELECT family_name FROM student WHERE family_name LIKE '%ng';

-- Update a record in the table
UPDATE student SET given_name = 'Jitao David' WHERE family_name = 'Zhang';

-- delete a record
DELETE FROM student WHERE family_name="Strahm";

-- alter table
ALTER TABLE student ADD COLUMN gender char;
UPDATE student SET gender='m' WHERE given_name IN ('Roland', 'Jitao David', 'Martin');
UPDATE student SET gender='w' WHERE given_name IN ('Laura', 'Verena');

SELECT * FROM student;

-- create a note table with FOREIGN KEY

-- force FOREIGN KEY constraint checking
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS note;
CREATE TABLE note (id PRIMARY KEY,
       	     	   student_id int NOT NULL, midterm real, endterm real,
       	     	   FOREIGN KEY (student_id) REFERENCES student(id)
);

INSERT INTO note ('id', 'student_id', 'midterm', 'endterm') VALUES (1, 1, 6, 6);
INSERT INTO note ('id', 'student_id', 'midterm', 'endterm') VALUES (2, 4, 5.5, 2.5);
INSERT INTO note ('id', 'student_id', 'midterm', 'endterm') VALUES (3, 6, 5.0, 5.5);

-- the following command will fail because PRAGMA foreign_keys = ON.
INSERT INTO note (id, student_id, midterm, endterm) VALUES (4, 27, 5.5, 5.5);

-- show note
SELECT * FROM note;

-- update the note table
UPDATE note SET endterm = 5.0 WHERE student_id = 4;

-- show note again
SELECT * FROM note;

-- delete the student number 6 will FAIL, because the foreign key constraint posed on note
DELETE FROM student WHERE id=6;

-- JOIN
SELECT family_name, given_name, midterm, endterm
  FROM student s
  JOIN note n
  ON s.id=n.student_id;

-- students in club
DROP TABLE IF EXISTS club;
CREATE TABLE club (id int PRIMARY KEY, name char);

INSERT INTO club ('id', 'name') VALUES (1, 'tennis');
INSERT INTO club ('id', 'name') VALUES (2, 'chess');
INSERT INTO club ('id', 'name') VALUES (3, 'go');
INSERT INTO club ('id', 'name') VALUES (4, 'running');
INSERT INTO club ('id', 'name') VALUES (5, 'music');

DROP TABLE IF EXISTS studentInClub;
CREATE TABLE studentInClub(student_id int,
			   club_id int,
			   FOREIGN KEY (student_id) REFERENCES student(id),
			   FOREIGN KEY (club_id) REFERENCES club(id));

INSERT INTO studentInClub('student_id', 'club_id') VALUES (1,4);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (1,5);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (2,5);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (3,4);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (3,5);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (4,1);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (4,3);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (4,5);
INSERT INTO studentInClub('student_id', 'club_id') VALUES (6,5);

-- question: what are the endterm scores of students that are are in the music club?
SELECT DISTINCT s.family_name FAMILYNAME, s.given_name GIVENAME, n.endterm FROM studentInClub sc
JOIN note n
ON sc.student_id = n.student_id
JOIN club c
ON c.name='music'
JOIN student s
ON sc.student_id = s.id;
