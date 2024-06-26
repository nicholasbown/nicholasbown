-- Create the Student table
CREATE TABLE Student (
    STU_NUM CHAR(6),
    STU_NAME VARCHAR(15),
    STU_FNAME VARCHAR(15),
    STU_INITIAL CHAR(1),
    STU_STARTDATE DATE,
    COURSE_CODE CHAR(3),
    PROJ_NUM INT(2)
);

-- Insert data into the Student table
INSERT INTO Student (STU_NUM, STU_NAME, STU_FNAME, STU_INITIAL, STU_STARTDATE, COURSE_CODE, PROJ_NUM) VALUES
('01', 'Snow', 'Jon', 'E', '2014-04-05', '201', 6),
('01', 'Stark', 'Arya', 'C', '2017-07-12', '305', 11),
('03', 'Lannister', 'Jamie', 'C', '2012-09-05', '101', 2),
('04', 'Lannister', 'Cercei', 'J', '2012-09-05', '101', 2),
('05', 'Greyjoy', 'Theon', 'I', '2015-12-09', '402', 14),
('06', 'Tyrell', 'Margary', 'Y', '2017-07-12', '305', 10),
('07', 'Baratheon', 'Tommen', 'R', '2019-06-13', '201', 5);

-- Select all records with COURSE_CODE of 305
SELECT * FROM Student
WHERE COURSE_CODE = '305';

-- Update course code to 304 for the student number 07
UPDATE Student
SET COURSE_CODE = '304'
WHERE STU_NUM = '07';

-- Delete the row for Jamie Lannister
DELETE FROM Student
WHERE STU_NAME = 'Lannister'
AND STU_FNAME = 'Jamie'
AND STU_STARTDATE = '2012-09-05'
AND COURSE_CODE = '101'
AND PROJ_NUM = 2;

-- Update PROJ_NUM to 14 for students who started before 1 January 2016 and whose course code is at least 201
UPDATE Student
SET PROJ_NUM = 14
WHERE STU_STARTDATE < '2016-01-01'
AND COURSE_CODE >= '201';

-- Drop the Student table
DROP TABLE Student;
