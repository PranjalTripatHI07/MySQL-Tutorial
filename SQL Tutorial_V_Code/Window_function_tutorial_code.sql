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

