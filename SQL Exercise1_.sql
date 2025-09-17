CREATE DATABASE InovationHUB_company;
USE InovationHUB_company;

CREATE TABLE Employee(
Emp_id  INT PRIMARY KEY,
Emp_Name  VARCHAR(100) NOT NULL,
Emp_Salary INT NOT NULL
);

INSERT INTO Employee VALUES(1, "Adam", 2500);
INSERT INTO Employee VALUES(2, "Bob", 40000);
INSERT INTO Employee VALUES(3, "Casey", 50000);
INSERT INTO Employee VALUES(4, "Jones", 80000);


SELECT * FROM Employee;
