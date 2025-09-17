use employees;

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


SELECT 
    t1.*
FROM
    salaries AS t1
WHERE
    EXISTS( SELECT 
            t2.*
        FROM
            titles AS t2
        WHERE
            t2.emp_no = t1.emp_no
                AND t2.title = 'Engineer');
                
                

/* Using subquery in select statement */

SELECT 
    t1.emp_no AS employee_id,
    MIN(t2.dept_no) AS department_code,
    (SELECT 
            t3.emp_no
        FROM
            dept_manager AS t3
        WHERE
            t3.emp_no = 110022) AS manager_id
FROM
    employees AS t1
        INNER JOIN
    dept_emp AS t2 ON t2.emp_no = t1.emp_no
WHERE
    t1.emp_no <= 10020
GROUP BY t1.emp_no
ORDER BY t1.emp_no ASC;


/* Using Subquery in from statement */

SELECT 
    A.*
FROM
    (SELECT 
        t1.emp_no AS employee_id,
            MIN(t2.dept_no) AS department_code,
            (SELECT 
                    t3.emp_no
                FROM
                    dept_manager AS t3
                WHERE
                    t3.emp_no = 110022) AS manager_id
    FROM
        employees AS t1
    INNER JOIN dept_emp AS t2 ON t2.emp_no = t1.emp_no
    WHERE
        t1.emp_no <= 10020
    GROUP BY t1.emp_no
    ORDER BY t1.emp_no ASC) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        t1.emp_no AS employee_id,
            MIN(t2.dept_no) AS department_code,
            (SELECT 
                    t3.emp_no
                FROM
                    dept_manager AS t3
                WHERE
                    t3.emp_no = 110039) AS manager_id
    FROM
        employees AS t1
    INNER JOIN dept_emp AS t2 ON t2.emp_no = t1.emp_no
    WHERE
        t1.emp_no <= 10020
    GROUP BY t1.emp_no
    ORDER BY t1.emp_no ASC
    LIMIT 20) AS B;


drop table if exists emp_manager;
CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);


INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    



SELECT 
    t1.emp_no,
    t1.title,
    (SELECT 
            ROUND(AVG(salary), 2)
        FROM
            salaries AS t2
        WHERE
            t2.emp_no = t1.emp_no) as avg_salary
FROM
    (SELECT 
        emp_no, title
    FROM
        titles
    WHERE
        title in('Staff','Engineer')) as t1
ORDER BY avg_salary DESC;



SELECT 
    t1.emp_no,
    t1.title,
    (SELECT 
            ROUND(AVG(salary), 2)
        FROM
            salaries AS t2
        WHERE
            t1.emp_no = t2.emp_no) AS avg_salary
FROM
    (SELECT 
        emp_no, title
    FROM
        titles
    WHERE
        title IN ('Staff' , 'Engineer')) AS t1
ORDER BY avg_salary DESC;




SELECT 
    t1.emp_no,
    t1.title,
    (SELECT 
            ROUND(AVG(salary))
        FROM
            salaries AS t2
        WHERE
            t2.emp_no = t1.emp_no) AS avg_salary
FROM
    (SELECT 
        emp_no, title
    FROM
        titles
    WHERE
        title IN ('Staff' , 'Engineer')) AS t1
ORDER BY avg_salary DESC;


