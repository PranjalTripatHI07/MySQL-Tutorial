use employees;
SELECT 
    *
FROM
    emp_manager;
    
    
SELECT 
    t2.*
FROM
    emp_manager AS t1
        JOIN
    emp_manager AS t2 ON t1.emp_no = t2.manager_no;
    
SELECT 
    t1.emp_no, t1.dept_no, t2.manager_no
FROM
    emp_manager AS t1
        JOIN
    emp_manager AS t2 ON t1.emp_no = t2.manager_no;
    
    
SELECT 
    e1.*
FROM
    emp_manager AS e1
        JOIN
    emp_manager AS e2 ON e1.emp_no = e1.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
            
SELECT DISTINCT
    e1.*
FROM
    emp_manager AS e1
        JOIN
    emp_manager AS e2 ON e1.emp_no = e2.manager_no;
    

SELECT DISTINCT
    e2.*
FROM
    emp_manager AS e1
        JOIN
    emp_manager AS e2 ON e1.manager_no = e2.emp_no
ORDER BY e2.emp_no DESC;