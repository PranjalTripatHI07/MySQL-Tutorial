/* Using Delet statement */

use employees;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments
ORDER BY dept_no DESC;
