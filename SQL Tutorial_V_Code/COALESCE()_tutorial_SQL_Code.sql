/* Coalesce() function Tutorial */
use employees;

SELECT 
    *
FROM
    department_dup
ORDER BY dept_no ASC;

alter table department_dup
change column dept_name dept_name varchar(40) Null;

insert into department_dup(dept_no)
values
("d010"),
("d011");

SELECT 
    *
FROM
    department_dup
ORDER BY dept_no ASC;

alter table employees.department_dup
add column dept_manager varchar(255) null after dept_name;

SELECT 
    *
FROM
    department_dup
ORDER BY dept_no ASC;


/* IFNULL() function() */

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided')
FROM
    department_dup;
    
SELECT 
    dept_no,
    IFNULL(dept_name, 'Department name not provided') AS department_name
FROM
    department_dup;
    
SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') AS department_name
FROM
    department_dup;
    
    
SELECT 
    *
FROM
    department_dup;
    
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    department_dup
ORDER BY dept_no ASC;



SELECT 
    dept_no, dept_name, COALESCE('NA') AS department_manager
FROM
    department_dup
ORDER BY dept_no ASC;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name, "N/A") AS dept_info
FROM
    department_dup
ORDER BY dept_no ASC;

SELECT 
    IFNULL(dept_no, 'NA') AS dept_no,
    IFNULL(dept_name,
            'Department name is not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    department_dup
ORDER BY dept_no ASC;

