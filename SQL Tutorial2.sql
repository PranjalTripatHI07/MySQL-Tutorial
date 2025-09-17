-- Command for creating data base
CREATE DATABASE college;

-- Command for selecting data base 
USE college;

-- Command for creating Table
CREATE TABLE student_db(
id   INT  PRIMARY KEY,
Student_Name VARCHAR(50),
Age INT NOT NULL
);

-- Command for inserting data into table 
INSERT INTO student_db VALUES(1, "Tony Stark", 20);
INSERT INTO student_db VALUES(2, "Bruce van", 22);

-- Commnd for printing data table
SELECT * FROM student_db;

-- Command for showing list of data base created 
SHOW DATABASES;

-- Command for showing list of tables in a database
SHOW TABLES;