CREATE DATABASE Employee_DB;
USE Employee_DB;

CREATE TABLE City_info(
id INT PRIMARY KEY,
city_name VARCHAR(200)
);

INSERT INTO City_info VALUES(1, "NEW YORK");
INSERT INTO City_info VALUES(2, "WASINGTON");

CREATE TABLE Employee_info(
id INT PRIMARY KEY,
Emp_name VARCHAR(200),
City_id INT,
FOREIGN KEY(City_id) REFERENCES City_info(id)
);

INSERT INTO Employee_info VALUES(1, "Adam", 1);
INSERT INTO Employee_info VALUES(2, "Bob", 1);
