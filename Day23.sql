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

-- Q4) Row number within each department by salary desc
select * , row_number() over(partition by department order by  salary desc ) from employees;

-- Q5) Rank within each department by salary desc
select * , rank() over(partition by department order by salary desc ) from employees;

-- Q6) Show previous and next salary in overall salary order (LAG/LEAD)
select * , lag(salary)  over() , lead(salary) over() from employees;

-- Q7) Running total of sales amounts by date (overall)
select * , sum(amount) over(order by sale_date) from sales ;

-- Q8) Running total of sales per employee by date
select * , sum(amount) over(partition by emp_id order by sale_date) from sales ;

-- Q9) Total sales per row (same total repeated using window SUM)
select * , sum(amount) over() from sales;

-- Q10) Average salary per department shown on every employee row
select * , avg(salary) over(partition by department ) from employees;


-- ====================== medium ======================================
-- Q1) Top 2 salaries in each department (use ROW_NUMBER)
select * from (select * ,  row_number() over(partition by department order by salary ) as row_value from employees ) tempdata where row_value <=2 ;

-- Q2) Salary difference vs department average
select * , avg(salary) over(partition by department ) , salary - avg(salary) over(partition by department )  from employees;

-- Q3) Percent rank of employees by salary (overall)
-- percent_rank() formula --> rank - 1 / total number of rows - 1 ;
select * , percent_rank() over(order by salary) from employees;
