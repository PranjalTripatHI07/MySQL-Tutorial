CREATE DATABASE practice_sql;
SHOW DATABASES;

USE practice_sql;

CREATE TABLE student_data(
roll_no INT PRIMARY KEY,
Student_name VARCHAR(200) NOT NULL,
Marks  INT NOT NULL,
Pass_Fail VARCHAR(50) 
);

INSERT INTO student_data(roll_no, student_name, Marks) 
VALUES(1, "Tony", 45);
INSERT INTO student_data(roll_no, student_name, Marks) 
VALUES(2, "Bruce", 85);
INSERT INTO student_data(roll_no, student_name, Marks) 
VALUES(3, "HULK", 45);
INSERT INTO student_data(roll_no, student_name, Marks) 
VALUES(4, "Superman", 95);
INSERT INTO student_data(roll_no, student_name, Marks) 
VALUES(5, "Batman", 25);

SELECT * FROM student_data;
