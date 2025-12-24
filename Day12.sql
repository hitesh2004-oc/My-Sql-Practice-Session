use regex;
-- Self Join - [A SQL Self Join is a regular join in which a table is joined with itself]
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    ManagerID INT
);
INSERT INTO Employees (EmpID, EmpName, ManagerID) VALUES
(1, 'Alice', NULL),     -- Top manager
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'David', 2),
(5, 'Eva', 2);

select * from employees;
SELECT e.EmpName AS Employee, m.EmpName AS Manager FROM Employees e LEFT JOIN Employees m ON e.ManagerID = m.EmpID;
create database Regex_1;
use Regex_1;
drop database Regex_1;
create database Regex_2;
use Regex_2;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    manager_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);
INSERT INTO employee (emp_id, emp_name, job_title, manager_id, salary) VALUES
(1, 'Alice', 'CEO', NULL, 120000),
(2, 'Bob', 'CTO', 1, 95000),
(3, 'Carol', 'CFO', 1, 90000),
(4, 'David', 'HR Manager', 1, 85000),
(5, 'Eve', 'Tech Lead', 2, 75000),
(6, 'Frank', 'Senior Developer', 2, 72000),
(7, 'Grace', 'Senior Developer', 2, 71000),
(8, 'Heidi', 'Developer', 5, 60000),
(9, 'Ivan', 'Developer', 5, 58000),
(10, 'Judy', 'Developer', 6, 59000),
(11, 'Mallory', 'Accountant', 3, 65000),
(12, 'Niaj', 'Financial Analyst', 3, 62000),
(13, 'Olivia', 'HR Executive', 4, 55000),
(14, 'Peggy', 'HR Executive', 4, 54000),
(15, 'Sybil', 'Intern', 8, 35000);
use regex_2;
select * from employee;
select em.emp_id,em.emp_name,em.manager_id,em.salary,mng.emp_id,mng.emp_name,mng.salary
from employee as em join employee as mng where em.manager_id = mng.emp_id ;

select mng.emp_name,count(em.emp_id) from employee as em join employee as mng 
where em.manager_id = mng.emp_id group by mng.emp_name;



