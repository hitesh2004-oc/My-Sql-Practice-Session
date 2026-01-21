USE window_fn_practice;
select * from employees;
-- (Q1) Add a row number for employees sorted by salary (highest first)
select emp_id, full_name, salary,
row_number() over(order by salary desc) as row_no from employees;

-- (Q2) Rank employees by salary (ties share rank)
select emp_id, full_name, salary,
rank() over(order by salary desc)from employees;

-- (Q3) Dense rank employees by salary (no gaps)
select emp_id, full_name, salary, 
dense_rank() over (order by salary desc) from employees;

