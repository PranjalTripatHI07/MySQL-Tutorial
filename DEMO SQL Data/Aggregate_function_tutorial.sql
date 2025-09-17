/* Using Count() Aggregate function */
use employees;
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    COUNT(salary)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT salary)
FROM
    salaries;
    
SELECT 
    COUNT(from_date)
FROM
    salaries;
    
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
    
SELECT 
    COUNT(*)
FROM
    salaries;
    
    
SELECT 
    *
FROM
    dept_emp;

SELECT 
    COUNT(distinct dept_no)
FROM
    dept_emp;
    
/* Using Sum() Aggregate function */

SELECT 
    SUM(salary)
FROM
    salaries;
    
SELECT 
    SUM(DISTINCT salary)
FROM
    salaries;
    
    
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT 
    SUM(DISTINCT salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
    
/* Using MAX() and MIN() aggregate function */

SELECT 
    MAX(salary)
FROM
    salaries;
    
SELECT 
    MIN(salary)
FROM
    salaries;
    
    
SELECT 
    MAX(DISTINCT salary)
FROM
    salaries;
    
SELECT 
    MIN(emp_no)
FROM
    employees;
    
SELECT 
    MAX(emp_no)
FROM
    employees;
    
/* Using AVG() aggregate function */


SELECT 
    AVG(salary)
FROM
    salaries;
    
SELECT 
    AVG(DISTINCT salary)
FROM
    salaries;
    
SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
/* Using ROUND() -> A single row function 
Note -> ROUND() is not a Aggregate function
*/

SELECT 
    AVG(salary)
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary))
FROM
    salaries;
    
SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    
SELECT 
    ROUND(salary, 2)
FROM
    salaries;
    

SELECT ROUND(145.715, 2);
SELECT ROUND(145.715, 0);
SELECT ROUND(145.715, - 1);
SELECT ROUND(145.715, - 2);


SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
SELECT 
    ROUND(AVG(salary)) AS average_salary
FROM
    salaries
WHERE
    from_date <= '1994-11-29';