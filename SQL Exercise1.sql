-- Create a database for your company 
-- step1 -> Create a table inside the database to store employee 
-- info (id, name, salary).

-- step2 -> Add following info in the DB 
-- 1, adam, 25000
-- 2, bob, 30000
-- 3, casey, 40000
-- 4, jones, 80000

-- step 3 select and view all your table data.


-- Solution 

CREATE DATABASE ApanaInovation_pvt_ltd;
USE ApanaInovation_pvt_ltd;

CREATE TABLE Employee_info(
Employee_id  INT PRIMARY KEY,
Employee_Name VARCHAR(200) NOT NULL,
Salary  INT NOT NULL
);

INSERT INTO Employee_info VALUES(1, "Adam", 25000);
INSERT INTO Employee_info VALUES(2, "Bob", 30000);
INSERT INTO Employee_info VALUES(3, "Casey", 40000);
INSERT INTO Employee_info VALUES(4, "Jones", 80000);

SELECT * FROM Employee_info;



