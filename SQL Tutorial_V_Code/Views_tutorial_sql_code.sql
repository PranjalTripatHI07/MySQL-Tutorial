use employees;
/* Using View in SQL */

CREATE VIEW V_dept_emp_latest_data AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
    
SELECT 
    *
FROM
    v_dept_emp_latest_data;
    

/* Example */

CREATE VIEW V_average_salary_of_all_managers AS
    SELECT 
        ROUND(AVG(salary), 2) AS avg_salary
    FROM
        salaries AS t1
            JOIN
        dept_manager AS t2 ON t1.emp_no = t2.emp_no;
        
SELECT 
    *
FROM
    V_average_salary_of_all_managers;
    
    
CREATE VIEW V_average_salary_of_all_managers AS
    SELECT 
        ROUND(AVG(salary), 2) AS avg_salary
    FROM
        salaries AS t1
            JOIN
        dept_manager AS t2 ON t1.emp_no = t2.emp_no
    ORDER BY t1.emp_no ASC;




SELECT 
    *
FROM
    V_average_salary_of_all_managers;


/* 
create view v_manager_avg_salary as 
select round(avg(salary), 2) as avg_salary 
from salaries as t1
where t1.emp_no in(10002, 10005, 10007) and t1.from_date between "1991-01-01" and "1996-01-31"; 
*/

CREATE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2) AS avg_salary
    FROM
        salaries AS t1
    WHERE
        t1.emp_no IN (10002 , 10005, 10007)
            AND t1.from_date BETWEEN '1991-01-01' AND '1996-01-31'; 

SELECT 
    *
FROM
    v_manager_avg_salary;

/* another solution */

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2) AS avg_salary
    FROM
        salaries AS t1
            INNER JOIN
        employees AS t2 ON t1.emp_no = t2.emp_no
    WHERE
        t1.emp_no IN (10002 , 10005, 10007)
            AND t1.from_date BETWEEN '1991-01-01' AND '1996-12-31';


SELECT 
    *
FROM
    v_manager_avg_salary;