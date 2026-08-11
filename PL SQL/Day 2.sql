-- Cursor :- it is pointer and it is refer to the context.
-- There are two Types of Cursor
-- implicit cursor :- it is cursor given by PL SQL 
-- when we perfoem dml command
-- %fount , %NotFound , %RowCount , %IsOpen

-- Create table emp_cp as select employee_id, first_name from hr.employees where employee_id between 100 and 104;
-- select * from emp_cp;

-- BEGIN
--     dbms_output.put_line('We are Inside the Begin');
--     Update emp_cp set first_name = 'Regex';

--     dbms_output.put_line(SQL%RowCount);
--     delete from emp_cp where employee_id = 101;
--     dbms_output.put_line(SQL%RowCount);
    
-- end;

-- declare
--     cursor emp_cur is select * from emp_cp; -- Cursor Created
--     emp_record emp_cp%rowtype; -- Record variable as same as of the table
-- begin
--     open emp_cur; -- opened cursor
--     Fetch emp_cur into emp_record;
    
--     if emp_cur%IsOpen THEN
--     DBMS_OUTPUT.put_line('Cursor Open');
--     end if;
    
--     if emp_cur%found then 
--     DBMS_OUTPUT.put_line('Cursor Open 1');
--     end if;
-- end;

-- declare
--     cursor emp_cur is select * from emp_cp; -- Cursor Created
--     emp_record emp_cp%rowtype; -- Record variable as same as of the table
-- begin
--     open emp_cur; -- opened cursor
--     Fetch emp_cur into emp_record;
--     -- You must need to open cursor
--     while emp_cur%found LOOP
--     DBMS_OUTPUT.put_line(emp_record.employee_id);
--     Fetch emp_cur into emp_record;

--     end loop;
-- end;

declare
    cursor emp_cur is select * from emp_cp; -- Cursor Created
    emp_record emp_cp%rowtype; -- Record variable as same as of the table
begin
    for i in emp_cur LOOP
    DBMS_OUTPUT.put_line(i.employee_id);

    end loop;
end;

-- What is Difference between Store Function and Procedure
-- Types of Parameter
-- In , Out , InOut Parameter