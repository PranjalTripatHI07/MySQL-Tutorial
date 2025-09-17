use employees;

/* Using IN operator in Where Clause */

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    

/* Using NOT IN operator in Where Clause */

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Jhon' , 'Mark', 'Jacob');
    
/* Using Like Operator in Where Clause */

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Mar');
    
/* Using Not Like Operator in Where Clause */

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar');
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');


SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    
/* Using Between Operator in Where Clause */

SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-010-01';


SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-010-01';
    

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    

SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    

SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd004' AND 'd008';
    

/* Using Is Null Operator in Where Clause */

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
    

SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
/* Using Arithmetic Operator in Where Clause */

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= "2000-01-01" AND gender = 'F';
    
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
    
/* Using Distinct Keyword */

SELECT 
    gender
FROM
    employees;
    

SELECT DISTINCT
    gender
FROM
    employees;
    

SELECT DISTINCT
    hire_date
FROM
    employees;

SELECT DISTINCT
    to_date
FROM
    titles;
    
SELECT 
    COUNT(distinct first_name)
FROM
    employees;
    
    
/* Using Aggregate Function */

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    COUNT(*)
FROM
    dept_manager;
    

/* Using Order By Clause */

SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name ASC , last_name ASC;


SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;


/* Using Group By Clause */

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary ASC;


SELECT 
    title, COUNT(emp_no) AS emps_with_same_job_title
FROM
    titles
WHERE
    to_date = '9999-01-01'
GROUP BY title
ORDER BY title ASC;


/* Using Having Clause */

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name ASC;

SELECT 
    emp_no, AVG(salary) AS Average_Salary
FROM
    salaries
GROUP BY emp_no 
HAVING AVG(salary) > 120000
ORDER BY emp_no ASC;

SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;



SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name ASC;


SELECT 
    emp_no, COUNT(emp_no) AS count_emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no ASC;


SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;


/* Using Limit Clause */

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;


SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC
LIMIT 100;


SELECT 
    *
FROM
    dept_emp
LIMIT 100;