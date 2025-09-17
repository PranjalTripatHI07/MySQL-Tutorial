CREATE DATABASE concept_foreign_key;

USE concept_foreign_key;


CREATE TABLE City_info(
id INT PRIMARY KEY,
City_name VARCHAR(200)
); 

INSERT INTO City_info VALUES(1, "New York");
INSERT INTO City_info VALUES(2, "Wasington");

CREATE TABLE Student_info(
id INT PRIMARY KEY,
Student_name  VARCHAR(200),
City_id INT, 
FOREIGN KEY(City_id) REFERENCES City_info(id)
);

INSERT INTO Student_info VALUES(1, "Adam", 1);
INSERT INTO Student_info VALUES(2, "Bob", 2);
INSERT INTO Student_info VALUES(3, "Jones", 2);
INSERT INTO Student_info VALUES(4, "Casey", 1);

