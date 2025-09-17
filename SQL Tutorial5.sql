CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE student(
roll_no INT PRIMARY KEY,
student_name VARCHAR(100)
);

-- This command print only selected column from table
SELECT id, student_name FROM student_db;

-- This command print all column from table
SELECT * FROM student;

