--    PL SQL [Procedural Language SQLl   --
-- It is Extension of SQL where we combine the capability of SQL of Programming Language Togather. 

-- Why we use PLSQL
-- Reusable Code: Create stored procedures, functions, triggers, and packages, which can be executed repeatedly.
-- Error Handling: PL/SQL provides a feature to handle the exception which occurs in PL/SQL block known as exception handling block.
-- We can Use all the Control flow Structure like while,for loop.

-- PL SQL Block
-- Declaration SQl Block DECLARE
-- Begin Block [Excutable Block]
-- Exception Block

-- PL SQL Cursor
-- this is pinter which Provide the Control over the Result of SQL queries.

-- DECLARE
--     var int := 1;
-- BEGIN
--     var := 11; -- Change value

--     IF MOD(var, 2) = 0 THEN
--         DBMS_OUTPUT.PUT_LINE('Hello World' || '  -  ' || var);
--     ELSE
--         DBMS_OUTPUT.PUT_LINE('Hello');
--     END IF;
--     DBMS_OUTPUT.PUT_LINE('Hey');
-- END;

-- DECLARE
--      var int := 0;
--      Begin
--          WHILE var <= 5 LOOP
--         DBMS_OUTPUT.PUT_LINE('Var is: ' || var);
--         var := var + 1; -- Manual increment is required
--     END LOOP;
-- END;

--  DECLARE
--    vname varchar(20);
--    vsalary hr.employees.salary%type;
--    begin
--     select first_name into vname from hr.employees where employee_id =101;
--     select salary into vsalary from hr.employees where employee_id =101;
--      DBMS_OUTPUT.PUT_LINE(vname);
--      DBMS_OUTPUT.PUT_LINE(vsalary);

--      end;

-- percentage row type
-- %ROWTYPE is an attribute used to declare a record variable 
-- that can hold an entire row of data from a database table, view, or cursor
-- we store or create column with its Datatype

-- Record datatype
-- It is a composite data structure that groups related data items of different data types into a single unit

-- % types vs %Row Type
-- how to Optimization SQL Queries
-- Create a PL SQL Program
-- Armstrong
-- Check Prime
-- Using While Find the LCM of Two Numbers
-- WHat is Cursor[Types Explicit and emplicit]

--  DECLARE
--  
--    vroc hr.employees.salary%rowtype;
--    begin
--     select * into vrow from hr.employees where employee_id =101;
--   
--      DBMS_OUTPUT.PUT_LINE(vrow.first_name);

--      end;

