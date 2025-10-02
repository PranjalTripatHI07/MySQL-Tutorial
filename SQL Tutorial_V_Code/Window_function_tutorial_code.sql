/** Topic -> Window Function **/


-- Using Row_number() ranking window function  


select emp_no,
       salary, 
       row_number() over([partition by emp_no] order by salary desc) as row_num

from salaries; 


--  Using Row_number() ranking window function with empty over clause

select emp_no,
       salary,
       row_number() over() as row_num

from salaries;
