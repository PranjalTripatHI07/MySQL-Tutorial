use employees;

create table departments_duplicate(
dept_no char(4) null,
dept_name varchar(40) null
);

insert into departments_duplicate(dept_no, dept_name)
select dept_no, dept_name
from departments;

insert into departments_duplicate(dept_name)
values
("Public Relation");


SET SQL_SAFE_UPDATES = 0;
DELETE FROM departments_duplicate 
WHERE
    dept_no = 'd002';


SELECT 
    *
FROM
    departments_duplicate
ORDER BY dept_no ASC;

insert into departments_duplicate(dept_no)
values
("d010"),
("d011");



/* Exercise 2 */

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup

select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';


/* Inner Join */

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

SELECT 
    *
FROM
    departments_duplicate
ORDER BY dept_no ASC;


SELECT 
    M.dept_no, M.emp_no, d.dept_name
FROM
   employees AS M
        INNER JOIN
    dept_manager_dup AS d ON M.dept_no = d.dept_no
ORDER BY M.dept_no ASC;


SELECT 
    M.emp_no, M.first_name, M.last_name, M.hire_date, d.dept_no
FROM
    employees AS M
        INNER JOIN
    dept_manager AS d ON M.emp_no = d.dept_no
ORDER BY M.emp_no ASC;


/* Duplicate Records */

insert into dept_manager_dup
values("110228", "d003", "1992-03-21", "9999-01-01");

insert into departments_duplicate
values("d009", "Customer Service");

SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

SELECT 
    *
FROM
    departments_duplicate
ORDER BY dept_no ASC;

/* Handeling Duplicate data in Inner Join we use Group by */

SELECT 
    M.dept_no, M.emp_no, d.dept_no
FROM
    dept_manager_dup AS M
        INNER JOIN
    departments_duplicate AS d ON M.dept_no = d.dept_no
GROUP BY M.emp_no, d.dept_no, M.dept_no
ORDER BY M.dept_no ASC;


/* Left Join */

DELETE FROM dept_manager_dup 
WHERE
    emp_no = '110228';

DELETE FROM departments_duplicate 
WHERE
    dept_no = 'd009';
    
insert into dept_manager_dup
values
("110228", "d003", "1992-03-21", "9999-01-01");

insert into departments_duplicate
values
("d009", "Customer Service");

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup AS m
        LEFT JOIN
    departments_duplicate AS d ON m.dept_no = d.dept_no
GROUP BY m.emp_no, m.dept_no, d.dept_name
ORDER BY m.dept_no ASC;

SELECT 
    em.emp_no,
    em.first_name,
    em.last_name,
    m.dept_no,
    m.from_date
FROM
    employees AS em
        LEFT JOIN
    dept_manager AS m ON em.emp_no = m.emp_no
WHERE
    em.last_name = 'Markovitch'
ORDER BY m.dept_no DESC , em.emp_no ASC;


/* Using Right Join */ 

SELECT 
    m.dept_no, m.emp_no, n.dept_name
FROM
    dept_manager_dup AS m
        RIGHT JOIN
    departments_duplicate AS n ON m.dept_no = n.dept_no
ORDER BY dept_no;


SELECT 
    m.emp_no, m.first_name, m.last_name, n.dept_no, n.from_date
FROM
    dept_manager AS n
        RIGHT JOIN
    employees AS m ON m.emp_no = n.emp_no
WHERE
    m.last_name = 'Bamford'
ORDER BY dept_no DESC;

/* New and old join Syntax */

SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    t2.dept_no,
    t2.from_date
FROM
    dept_manager AS t2,
    employees AS t1
WHERE
    t1.emp_no = t2.emp_no;   


/* Example with old join method */

SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    t2.dept_no,
    t1.hire_date
FROM
    employees AS t1,
    dept_manager AS t2
WHERE
    t1.emp_no = t2.emp_no
ORDER BY emp_no ASC;

/* Example with new join method */

SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    t2.dept_no,
    t1.hire_date
FROM
    employees AS t1
        INNER JOIN
    dept_manager AS t2 ON t1.emp_no = t2.emp_no
ORDER BY emp_no ASC;

/* Using Join + Where Together */

SELECT 
    t1.emp_no, t1.first_name, t1.last_name, t2.salary
FROM
    employees AS t1
        INNER JOIN
    salaries AS t2 ON t1.emp_no = t2.emp_no
WHERE
    t2.salary > '145000';


SELECT 
    t1.first_name, t1.last_name, t1.hire_date, t2.title
FROM
    employees AS t1
        INNER JOIN
    titles AS t2 ON t1.emp_no = t2.emp_no
WHERE
    t1.first_name = 'Margareta'
        AND t1.last_name = 'Markovitch';
        
        
/* Cross Join */

SELECT 
    *
FROM
    dept_manager
        CROSS JOIN
    departments;
 

SELECT 
    *
FROM
    dept_manager AS t1
        CROSS JOIN
    departments AS t2
ORDER BY t1.emp_no ASC , t2.dept_no ASC;


SELECT 
    t1.emp_no,
    t1.dept_no,
    t1.from_date,
    t1.to_date,
    t2.dept_no,
    t2.dept_name
FROM
    dept_manager as t1
        CROSS JOIN
    departments as t2; 


SELECT 
    t1.emp_no,
    t1.dept_no,
    t1.from_date,
    t1.to_date,
    t2.dept_no,
    t2.dept_name
FROM
    departmets as t2
        CROSS JOIN
    dept_manager as t1; 

SELECT 
    t2.dept_name,
    t1.emp_no,
    t1.dept_no,
    t1.from_date,
    t1.to_date,
    t2.dept_no
   
FROM
    departments as t2
        CROSS JOIN
    dept_manager as t1;
    
SELECT 
    *
FROM
    dept_manager AS t1
        CROSS JOIN
    departments AS t2
WHERE
    t1.dept_no != t2.dept_no
ORDER BY t1.emp_no ASC , t2.dept_no ASC;


/* Cross Join combine with inner join */

SELECT 
    e.*, t1.*, t2.*
FROM
    dept_manager AS t1
        CROSS JOIN
    departments AS t2
        INNER JOIN
    employees AS e ON e.emp_no = t1.emp_no
WHERE
    t2.dept_no != t1.dept_no
ORDER BY t1.emp_no ASC , t2.dept_no ASC;

SELECT 
    e.*, t2.*
FROM
    dept_manager AS t1
        CROSS JOIN
    departments AS t2
        INNER JOIN
    employees AS e ON e.emp_no = t1.emp_no
ORDER BY t1.emp_no ASC , t2.dept_no ASC;


/* Example */

SELECT 
    *
FROM
    dept_manager AS t1
        CROSS JOIN
    departments AS t2
WHERE
    t2.dept_no = 'd009'
ORDER BY t2.dept_no ASC;

SELECT 
    *
FROM
    employees AS t1
        CROSS JOIN
    departments AS t2
WHERE
    t1.emp_no < 10011
ORDER BY t1.emp_no ASC , t2.dept_name ASC;

/* Using Aggregate function with Join */

SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees AS e
        INNER JOIN
    salaries AS s ON e.emp_no = s.emp_no
GROUP BY e.gender;



/* Join more than two tables in SQL */

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    n.dept_name
FROM
    employees AS e
        INNER JOIN
    dept_manager AS m ON e.emp_no = m.emp_no
        INNER JOIN
    departments AS n ON m.dept_no = n.dept_no;
    
    
/* Example joing multiple tables by using joins */


SELECT 
    t1.first_name,
    t1.last_name,
    t1.hire_date,
    t2.title,
    t2.from_date,
    t3.dept_name
FROM
    employees AS t1
        CROSS JOIN
    departments AS t3
        INNER JOIN
    titles AS t2 ON t1.emp_no = t2.emp_no;
    
    
SELECT 
    t1.first_name,
    t1.last_name,
    t1.hire_date,
    t2.title,
    t3.from_date,
    t4.dept_name
FROM
    employees AS t1
        INNER JOIN
    titles AS t2 ON t1.emp_no = t2.emp_no
        INNER JOIN
    dept_manager AS t3 ON t3.emp_no = t1.emp_no
        INNER JOIN
    departments AS t4 ON t3.dept_no = t4.dept_no
WHERE
    t2.title = 'Manager'
ORDER BY t1.emp_no ASC;
    
    
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;



SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
        AND m.from_date = t.from_date
ORDER BY e.emp_no;

/* tips and tricks for joins */

SELECT 
    t1.dept_name, AVG(t3.salary) AS Average_Salary
FROM
    departments AS t1
        INNER JOIN
    dept_manager AS t2 ON t1.dept_no = t2.dept_no
        INNER JOIN
    salaries AS t3 ON t2.emp_no = t3.emp_no
GROUP BY t1.dept_name
HAVING average_salary > 60000
ORDER BY Average_Salary DESC;

SELECT 
    t1.gender, COUNT(t2.emp_no) AS count_emp
FROM
    employees AS t1
        INNER JOIN
    dept_manager as t2 ON t1.emp_no = t2.emp_no
GROUP BY t1.gender;


/* Union and Union all */




/* Subquery with where clause by using IN operator */

SELECT 
    *
FROM
    dept_manager;

SELECT 
    t1.first_name, t1.last_name
FROM
    employees AS t1
WHERE
    t1.emp_no IN (SELECT 
            t2.emp_no
        FROM
            dept_manager AS t2);
            
SELECT 
    hire_date
FROM
    employees;
    
    

SELECT 
    t1.*
FROM
    dept_manager AS t1
WHERE
    t1.emp_no IN (SELECT 
            t2.emp_no
        FROM
            employees AS t2
        WHERE
            t2.hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            

/* subquery with where by using exist and exist not operator */

SELECT 
    t1.first_name, t1.last_name
FROM
    employees AS t1
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager AS t2
        WHERE
            t2.emp_no = t1.emp_no);

