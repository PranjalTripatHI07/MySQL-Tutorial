/** Topic -> Window Function **/


-- Using Row_number() ranking window function  


select emp_no,
       salary, 
       row_number() over(partition by emp_no order by salary desc) as row_num

from salaries; 


--  Using Row_number() ranking window function with empty over clause

select emp_no,
       salary,
       row_number() over() as row_num

from salaries;



-- Multiple row_number ranking window function

select emp_no,
       salary,
       row_number() over(partition by emp_no) as row_num1,
       row_number() over(partition by emp_no order by salary desc) as row_num2

from salaries;



-- Exercise 

select dm.emp_no,
       salary, 
       row_number() over(partition by emp_no) as row_num1,
       row_number() over(partition by emp_no order by salary asc) as row_num2

from dept_manager as dm
inner join salaries as s
on dm.emp_no = s.emp_no 
order by row_num1, emp_no, salary asc;



SELECT dm.emp_no,
       salary,
       ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num1,
       ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2   

FROM dept_manager dm
INNER JOIN salaries s 
ON dm.emp_no = s.emp_no;


-- Partition by clause vs Group by clause 

-- Exercise 1
-- sol 1
select temp.emp_no,
       min(salary) as lowest_salary
from (select emp_no,
             salary, 
             row_number() over w as row_num
       from salaries
       window w as (Partition by emp_no order by salary desc)) as temp

group by emp_no;


-- Exercise 2
-- sol 2

select temp.emp_no,
       min(salary) as lowest_salary
from (select emp_no,
             salary,
             row_number() over(Partition by emp_no order by salary desc) as row_num
      from salaries) as temp

group by emp_no;


-- Exercise 4 
-- sol 4
-- without using window function 
select temp.emp_no,
       min(salary) as lowest_salary
from (select emp_no,
             salary
       from salaries ) as temp

group by emp_no;


-- Exercise 5
-- sol 5 
-- Here we obtain output without using group by clause instead we use 
-- where clause 

select temp.emp_no,
       temp.salary as lowest_salary
from (select emp_no,
             salary,
             row_number() over w as row_num 
       from salaries
       window w as (Partition by emp_no order by salary desc)) as temp

where temp.row_num = 1;


-- Exercise 6
-- sol 6 
-- here we are finding second lowest salary of employee without using group by clause

select temp.emp_no,
       temp.salary as lowest_salary
from (select emp_no,
             salary,
             row_number() over w as row_num 
       from salaries
       window w as (Partition by emp_no order by salary desc)) as temp

where temp.row_num = 2;





-- Retrieve the employee number (emp_no) and the lowest contract 
-- salary value (salary, using the alias min_salary) for all managers. 
-- To obtain the desired output, you need to refer to the dept_manager 
-- and salaries tables.

select temp.emp_no,
       min(salary) as min_salary
from (select emp_no,
             salary,
             row_number() over(Partition by emp_no  order by salary asc) as row_num
      from salaries) as temp 
inner join dept_manager as dept
on dept.emp_no = temp.emp_no
group by temp.emp_no;


-- Topic -> Rank() Ranking window function 
-- Rank() window function syntax 
select column_name1,
       column_name2, .....,
       rank() over(Partition by column_name, ..... order by column_name asc | desc)
from table_name;

-- Alternate syntax for rank() window function
-- here we use window clause 

select column_name1,
       column_name2, .....,
       rank() over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by column_name, ..... order by column_name asc | desc);


-- Example 1 

select emp_no,
       salary,
       rank() over w as rank_num
from salaries
where emp_no = 10005
window w as (Partition by emp_no order by salary desc);

-- Example 2
select emp_no,
       salary,
       rank() over(Partition by emp_no order by salary desc) as rank_num
from salaries;




-- Topic -> Dense_rank() window function 
-- Dense_rank() window function syntax 

SELECT
    column_name1,
    column_name2, .....,
    DENSE_RANK() OVER (PARTITION BY column_name, ..... ORDER BY column_name ASC | DESC)
FROM
    table_name;


-- Alternate syntax for Dense_rank() window function
-- here we use window clause 

select column_name1,
       column_name2, .....,
       dense_rank() over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by column_name, ..... order by column_name asc | desc);



-- Example 1
select emp_no,
       salary,
       dense_rank() over(Partition by emp_no order by salary desc) as rank_num

from salaries 
where emp_no = 10005;


-- Example 2 
select emp_no,
       salary,
       dense_rank() over w as rank_num
from salaries
where emp_no = 10005
window w as (Partition by emp_no order by salary desc);


-- Exercise 1

-- Write a query containing a window function to obtain 
--all salary values that employee number 10560 has ever signed a 
--contract for.
-- Order and display the obtained salary values from highest to lowest.

-- sol 

select emp_no,
       salary,
       row_number() over w as row_num
from salaries 
where emp_no = 10560
window w as (Partition by emp_no order by salary desc);



--  Exercise 2

--Write a query that upon execution, displays the number of 
--salary contracts that each manager has ever signed while working 
--in the company.

-- sol

select dept.emp_no, 
       count(salary) as no_of_salary_contracts
from dept_manager as dept
inner join salaries as s
on dept.emp_no = s.emp_no
group by emp_no
order by emp_no;



-- Exercise 4

-- Write a query that upon execution retrieves a result set 
--containing all salary values that employee 10560 has ever signed a 
--contract for. Use a window function to rank all salary values from 
--highest to lowest in a way that equal salary values bear the same 
--rank and that gaps in the obtained ranks for subsequent rows are allowed

-- sol

select emp_no,
       salary,
       rank() over w as rank_num
from salaries 
where emp_no  = 10560
window w as (Partition by emp_no order by salary desc);


-- Exercise 5

--Write a query that upon execution retrieves a result set containing 
--all salary values that employee 10560 has ever signed a contract for. 
--Use a window function to rank all salary values from highest to 
--lowest in a way that equal salary values bear the same rank and that
--gaps in the obtained ranks for subsequent rows are not allowed.

-- sol

select emp_no,
       salary,
       dense_rank() over w as rank_num
from salaries 
where emp_no  = 10560
window w as (Partition by emp_no order by salary desc);



-- More Complex examples 

-- Example 1 
-- Here we use window functions and joins together for complex Query

select dept.dept_no,
       dept.dept_name,
       m.emp_no,
       rank() over w as department_salary_ranking,
       s.salary,
       s.from_date as salary_from_date,
       s.to_date as salary_to_date,
       m.from_date as dept_manager_from_date,
       m.to_date as dept_manager_to_date      
from dept_manager as m
inner join salaries as s
on m.emp_no = s.emp_no and s.from_date between m.from_date and m.to_date
       and s.to_date between m.from_date and m.to_date
inner join departments as dept
on dept.dept_no = m.dept_no
window w as (Partition by m.dept_no order by s.salary desc);



-- Exercise 1
-- sol

select e.emp_no,
       s.salary,
       rank() over w as rank_num
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no
where e.emp_no between 10500 and 10600
window w as (Partition by e.emp_no order by s.salary desc);


-- Exercise 2
-- sol

select e.emp_no,
       dense_rank() over w as rank_num,
       s.salary,
       e.hire_date,
       s.from_date,
       (year(s.from_Date) - year(e.hire_date)) as year_from_start
from employees as e
inner join salaries as s
on e.emp_no  = s.emp_no
       and year(s.form_date) - year(e.hire_date) >= 5
where e.emp_no between 10500 and 10600
window w as (Partition by e.emp_no order by s.salary desc);




-- Exercise 4
-- Allowing gaps in the obtained ranks for subsequent rows, rank the 
--contract salary values from highest to lowest for employees 10001, 
--10002, 10003, 10004, 10005, and 10006.
--Every row in the desired output should contain an employee number 
--(emp_no) obtained from the employees table, and a salary value 
--obtained from the salaries table. Additionally, include the salary 
--ranking values between the two columns in a field named 
--employee_salary_ranking.

--sol
select e.emp_no,
       rank() over w as employee_salary_ranking,
       s.salary 
       
from employees as e
inner join salaries as s 
on e.emp_no = s.emp_no
where e.emp_no in(10001,10002,10003,10004,10005,10006)
window w as (Partition by e.emp_no order by s.salary desc);


-- Exercise 5
--Without allowing gaps in the obtained ranks for subsequent rows, 
--rank the contract salary values from highest to lowest for 
--employees 10001, 10002, and 10003.
--Every row in the desired output should contain the relevant 
--employee number (emp_no) and the hire date (hire_date) from the 
--employees table, as well as the relevant salary value and the 
--start date (from_date) from the salaries table. Additionally, 
--include the salary ranking values in a field named 
--employee_salary_ranking.
--Retrieve only data for contracts that have started prior to 2000. 
--Sort your data by the  emp_no in ascending order, referring to the 
--employees table.

select e.emp_no,
       dense_rank() over w as employee_salary_ranking,
       s.salary,
       e.hire_date,
       s.from_date
    
from employees as e 
inner join salaries as s 
on e.emp_no = s.emp_no  and s.from_date < '2000-01-01'

where e.emp_no in(10001,10002,10003)
window w as (Partition by e.emp_no order by s.salary desc)
order by e.emp_no asc;







-- Topic -> Value window functions 

-- lag() value window function syntax 

select col_name1,
       col_name2, .....,
       lag(specific_col_name, no_of_rows_look_back, default_value) over(Partition by col_name, ..... order by col_name asc | desc)
from table_name;



-- alternate syntax for lag() value window function using window clause
-- here we use window clause
select col_name1,
       col_name2, .....,
       lag(specific_col_name, no_of_rows_look_back, default_value) over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by col_name, ..... order by col_name asc | desc);



-- Example 1
select emp_no, 
       salary,
       lag(salary) over(Partition by emp_no order by salary asc) as previous_salary
from salaries 
where emp_no = 10001;



-- Example 2 
-- Here we use window clause 
select emp_no,
       salary,
       lag(salary) over w as previous_salary

from salaries 
where emp_no = 10001
window w as (Partition by emp_no order by salary asc);




-- Topic Lead() value window function

-- Lead() value window function syntax 

select col_name1,
       col_name2, .....,
       lead(specific_column_name, no_of_rows_looks_ahead, default_value) over(Partition by col_name, ..... order by col_name asc|desc)

from table_name;

-- Alterntive syntax for lead() value window function
-- here we use window clause 

select col_name1,
       col_name2, ....., 
       lead(specific_col_name, no_of_rows_looks_ahead, default_value) over window_clause_name as rename_name

from table_name
window window_clause_name as (Partition_by col_name, ..... order by col_name asc|desc);


-- Example 1

select emp_no, 
       salary,
       lead(salary) over(Partition by emp_no order by salary asc) as next_salary 
from salaries 
where emp_no = 10001;


-- Example 2

select emp_no,
       salary,
       lead(salary) over w as next_salary

from salaries 
where emp_no = 10001
window w as (Partition by emp_no order by salary asc);


-- More Example 
-- Example 1
-- here we use lag() and lead() window function to find the difference between previous and nex salary with current salary

select emp_no,
       salary,
       lag(salary) over w as previous_salary,
       lead(salary) over w as next_salary,
       salary - lag(salary) over w as diff_salary_current_previous,
       salary - lead(salary) over w as diff_salary_next_current

from salaries
where emp_no = 10001
window w as (order by salary asc);



-- Exercise 1
-- sol
SELECT
    emp_no,
    salary,
    LAG(salary) OVER w AS previous_salary,
    LEAD(salary) OVER w AS next_salary,
    salary - LAG(salary) OVER w AS diff_between_current_and_previous_salary,
    salary - LEAD(salary) OVER w AS diff_between_current_and_next_salary
FROM
    salaries
WHERE
    emp_no IN (10500, 10600) AND salary > 80000
WINDOW w AS (PARTITION BY emp_no ORDER BY salary ASC);



-- Exercise 2 
-- sol

SELECT emp_no,
       salary,
       LAG(salary) OVER w AS previous_salary,
       LAG(salary, 2) OVER w AS 1_before_previous_salary,
       LEAD(salary) OVER w AS next_salary,
       LEAD(salary, 2) OVER w AS 1_after_next_salary

FROM salaries

WINDOW w AS (PARTITION BY emp_no ORDER BY salary)

LIMIT 1000;



-- Example 4 
-- For employees with employee numbers between 10003 and 10008, 
-- inclusive, and their salary contracts with values less than 
-- $70,000, retrieve the following data from the salaries table:
-- employee number (emp_no)
-- salary (salary)
-- previous salary (previous_salary)
-- next salary (next_salary)
-- the difference between the current salary of a certain employee 
--and their previous salary (diff_salary_current_previous)
-- the difference between the next salary of a certain employee and 
-- their current salary (diff_salary_next_current).

-- sol 

select emp_no,
       salary,
       lag(salary) over w as previous_salary,
       lead(salary) over w as next_salary,
       salary - lag(salary) over w as diff_salary_current_previous,
       lead(salary) over w - salary  as diff_salary_next_current
       
from salaries 
where emp_no between 10004 and 10008 and salary < 70000
window w as (Partition by emp_no order by salary asc);



-- Exercise 5
-- Retrieve the following data from the salaries table:
-- employee number (emp_no)
-- salary (salary)
-- use a window function to obtain the salary value of three contracts 
-- prior to the given employee contract salary value, if applicable. 
-- Name the column _before_previous_salary
-- use a window function to obtain the salary value of three 
-- contracts after the given employee contract salary value, 
-- if applicable. Name the column _after_next_salary.
-- To obtain the desired output, partition the data by employee number (emp_no) and order by salary (salary) in ascending order. Retrieve only the first one hundred rows of data.

-- sol

select emp_no,
       salary,
       lag(salary, 2) over w as _before_previous_salary,
       lead(salary, 2) over w as _after_next_salary
       
from salaries 
window w as (Partition by emp_no order by salary asc)
limit 100;




-- Topic -> First_value() value window function 

-- Syntax for First_value() value window function

select col_name1, 
       col_name2, ....., 
       first_value(specific_col_name) over(Partition by col_name, ..... order by col_name asc | desc)
from table_name;



-- Alternative syntax for first_value() value window function (using window clause) 

select col_name1, 
       col_name2, ....., 
       last_value(specific_col_name) over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by col_name, ..... order by col_name asc | desc);






-- Topic -> Last_value() value windoow function

-- Syntax for last_value() value window function

select col_name1, 
       col_name2, ....., 
       last_value(specific_col_name) over(Partition by col_name, ..... order by col_name asc | desc 
rows between unbounded preceding and unbounded following)
from table_name;


-- Alternative syntax for last_value() value window function (using window clause) 

select col_name1, 
       col_name2, ....., 
       last_value(specific_col_name) over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by col_name, ..... order by col_name asc | desc 
rows between unbounded preceding and unbounded following);




-- Topic ->  Nth_value() value window function 

-- Syntax for nth_value() value window function

SELECT
    col_name1,
    col_name2,
    .....,
    NTH_VALUE(col_name, nth_position) OVER(
    PARTITION BY col_name, .....
    ORDER BY col_name ASC | DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM
    table_name;



-- Syntax for nth_value() value window function by using window clause

SELECT
    col_name1,
    col_name2,
    .....,
    NTH_VALUE(col_name, nth_position) OVER window_clause_name AS rename_name
FROM
    table_name
WINDOW window_clause_name AS (
    PARTITION BY col_name, .....
    ORDER BY col_name ASC | DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);




-- Topic - Aggrigate window function 

-- Syntax for Aggregate Window function

select col_name1,
       col_name2, .....,
       aggregate_function(col_name) over(Partition by col_name, ..... order by col_name asc | desc)       
from table_name;


-- Alternative Syntax for Aggregate window function by using window clause 

select col_name1,
	   col_name2, .....,
	   Aggregate_function(co_name) over window_clause_name as rename_name
from table_name
window window_clause_name as (Partition by col_name, ..... order by col_name asc | desc);




-- Execise 1

select s1.emp_no,
       s.salary,
       s.form_date,
       s.to_date
from salaries as s
inner join (select emp_no, 
                   min(from_date) as from_date
            from salaries
            group by emp_no) as s1
on s.emp_no = s1.emp_no
where s.from_date = s1.from_date;




-- Example 1

USE employees;
 
SELECT * FROM dept_emp LIMIT 1000;
SELECT * FROM dept_emp WHERE emp_no = 10010 ORDER BY from_date;
SELECT * FROM dept_emp WHERE emp_no = 10018 ORDER BY from_date;
 
SELECT * FROM salaries WHERE emp_no = 10010 ORDER BY from_date;
 
 
SELECT 
    de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
    dept_emp de
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        dept_emp
    GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE
    de.to_date > SYSDATE()
        AND de.from_date = de1.from_date;
 
 
SELECT 
    de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department
FROM
    (SELECT 
    de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
    dept_emp de
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        dept_emp
    GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no
WHERE
    de.to_date > SYSDATE()
        AND de.from_date = de1.from_date) de2
        JOIN
    (SELECT 
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM
    salaries s
        JOIN
    (SELECT 
        emp_no, MAX(from_date) AS from_date
    FROM
        salaries	
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
    s.to_date > SYSDATE()
        AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
			JOIN
    departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no;




-- Exercise 2
/**
Consider the employees' contracts that have been signed after 
the 1st of January 2000 and terminated before the 1st of January 2002 
(as registered in the "dept_emp" table).

Create a MySQL query that will extract the following information 
about these employees:

- Their employee number

- The salary values of the latest contracts they have signed during 
the suggested time period

- The department they have been working in (as specified in the 
latest contract they've signed during the suggested time period)

- Use a window function to create a fourth field containing 
the average salary paid in the department the employee was last 
working in during the suggested time period. Name that 
field "average_salary_per_department".

**/
SELECT de2.emp_no, 
	   d.dept_name, 
	   s2.salary, 
	   AVG(s2.salary) OVER w AS average_salary_per_department
	
FROM (SELECT de.emp_no, 
	         de.dept_no, 
	         de.from_date, 
	         de.to_date 
	 FROM dept_emp de
	 INNER JOIN (SELECT emp_no, 
	                    MAX(from_date) AS from_date 
	             FROM dept_emp 
	             GROUP BY emp_no) AS de1 
	 ON de1.emp_no = de.emp_no
	 WHERE de.to_date < '2002-01-01' AND de.from_date > '2000-01-01' 
	 AND de.from_date = de1.from_date) AS de2

INNER JOIN (SELECT s1.emp_no, 
	               s.salary, 
	               s.from_date, 
	               s.to_date 
	        FROM salaries AS s
	        INNER JOIN (SELECT emp_no, 
	                           MAX(from_date) AS from_date 
	                    FROM salaries 
	                    GROUP BY emp_no) AS s1 
	        ON s.emp_no = s1.emp_no 
	        WHERE s.to_date < '2002-01-01' AND s.from_date > '2000-01-01' 
	        AND s.from_date = s1.from_date) AS s2 
ON s2.emp_no = de2.emp_no

INNER JOIN departments AS d 
ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no, salary;




-- Topic Common Table Expression (CTEs)

-- syntax for CTEs 

with cte_name  AS ( -- This is the query that defines the CTE
                                    select col_name1, 
                                                col_name2, .....
                                     from  table_name
                                     where  col_name  condition )

-- This is the main query that uses the CTE
select col_name1, 
            col_name2, .....
from cte_name
where col_name condition;
                                               

-- syntax break down 
/** 
The WITH clause: This defines the name of the CTE (CteName) and 
the query.

The main query: This is the final SELECT (or INSERT, UPDATE, DELETE) 
statement that uses the CTE.

Note ->  Basically in CTEs Syntax we have Two parts In first part we 
use with clause to define the cte_name and its query.
And the second part is the main query part where we can use 
select, insert, update, delete commands to use the above cte query 

Also Note -> We cannot use insert,update and delete commands in the with 
clause part we can only use select command inside with clause part

But in the main query part we can use select, insert, update and delete 
commands 

**/

-- Exercise 1

/** 

Use a CTE (a Common Table Expression) and a SUM() function in the 
SELECT statement in a query to find out how many salary contracts 
signed by male employees had a salary value below or equal to the 
all-time company average.
In this task, a salary contract is defined as any record in the 
salaries table.

**/ 

-- sol 

with cte AS (
	select avg(salary) as avg_salary
	from salaries 
	)

select sum(case when s.salary < c.avg_salay then 1 
                else 0
	        end) as no_salaries_below_avg,
       count(s.salary) as no_of_salary_contracts
from salaries as s
inner join employess as e
on s.emp_no = e.emp_no and e.gender = "M" 
cross join cte as c;





-- Example  for using multiple ctes 
/** 
Use two common table expressions and a SUM() function in the SELECT 
statement of a query to obtain the number of male employees whose 
highest salaries have been below the all-time average.
**/

WITH cte1 AS (

SELECT AVG(salary) AS avg_salary FROM salaries

),

cte2 AS (

SELECT s.emp_no, MAX(s.salary) AS max_salary

FROM salaries s

JOIN employees e ON e.emp_no = s.emp_no AND e.gender = 'M'

GROUP BY s.emp_no

)

SELECT

SUM(CASE WHEN c2.max_salary < c1.avg_salary THEN 1 ELSE 0 END) AS highest_salaries_below_avg

FROM employees e

JOIN cte2 c2 ON c2.emp_no = e.emp_no

JOIN cte1 c1;




-- Exercise 
/**Considering the salary contracts signed by female employees in 
the company, how many have been signed for a value below the average? 
Store the output in a column named no_f_salaries_below_avg. In a second
column named total_no_of_salary_contracts, provide the total number of 
contracts signed by all employees in the company.

Use the salary column from the salaries table and the gender column 
from the employees table. Match the two tables on the employee number 
column (emp_no).
**/ 
-- Sol

WITH cte1 AS (
  SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
  SELECT e.emp_no, s.salary, e.gender
  FROM salaries s
  INNER JOIN employees e 
  on s.emp_no = e.emp_no
)
 
SELECT 
  COUNT(CASE WHEN cte2.gender = 'F' AND cte2.salary < cte1.avg_salary THEN 1 ELSE NULL END) AS no_f_salaries_below_avg,
  COUNT(*) AS total_no_of_salary_contracts
FROM cte2
INNER JOIN cte1;




-- Exercie 
/**
Considering the salary contracts signed by male employees in the 
company, how many have been signed for a value above the average? 
Store the output in a column named no_m_salaries_above_avg. In a 
second column named total_no_of_salary_contracts, provide the total 
number of contracts signed by all employees in the company.

Use the salary column from the salaries table and the gender column 
from the employees table. Match the two tables on the employee number 
column (emp_no)


**/

-- Sol 
WITH cte1 AS (
  SELECT AVG(salary) AS avg_salary FROM salaries
),
cte2 AS (
  SELECT e.emp_no, s.salary, e.gender
  FROM salaries s
  INNER JOIN employees e USING (emp_no)
)
 
SELECT 
  COUNT(CASE WHEN cte2.gender = 'M' AND cte2.salary > cte1.avg_salary THEN 1 ELSE NULL END) AS no_m_salaries_above_avg,
  COUNT(*) AS total_no_of_salary_contracts
FROM cte2
INNER JOIN cte1;



-- Topic -> Temporary Table 

-- Syntax for Temporary Table 
CREATE TEMPORARY TABLE temp_table_name AS
SELECT
    col_name1,
    col_name2, .....
FROM
    table_name
WHERE
    col_name condition
GROUP BY
    col_name
HAVING
    col_name condition;



-- Example 

create temporary table Male_highest_salaries AS 
select s.emp_no,
       max(s.salary) as male_highest_salary
from salaries as s
inner join employees as e 
on s.emp_no = e.emp_no and e.gender = "M"
group by s.emp_no;


select * from Male_highest_salaries 
where emp_no <= 10010;

-- For deleting Temporary table manually use below syntax 
drop temporary table if exists temp_table_name;
