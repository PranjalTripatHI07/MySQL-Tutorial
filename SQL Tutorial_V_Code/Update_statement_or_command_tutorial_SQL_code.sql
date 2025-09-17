/* Using Update statement */

use employees;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;


SELECT 
    *
FROM
    department_dup
ORDER BY dept_no asc;


UPDATE department_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control'; /* This will update all rows */
    

SELECT 
    *
FROM
    departments
ORDER BY dept_no ASC;


UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';

SELECT 
    *
FROM
    departments
ORDER BY dept_no ASC;