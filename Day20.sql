-- ddl (data definition language )
-- create (table)
-- drop , truncate , alter 

use regex;
-- create 
create table vinod(id int);

-- create a table using select (CTAS)
create table actor_cp as 
select first_name , last_name from sakila.actor;

select * from actor_cp;

-- drop ( table structure and data both are deleted )
drop table actor_cp;

create table actor_cp as 
select first_name as fname , last_name as last from sakila.actor
where actor_id between 10 and 14;


-- alter 
alter table actor_cp add column (salary  int); 
 select * from actor_cp;
 
 alter table actor_cp add constraint new_key primary key (fname);
 desc actor_cp;
 
 alter table actor_cp drop column last;
 desc actor_cp;
 
 alter table actor_cp rename column salary to newsalary;
 select * from actor_cp;
 
 
 
 -- === DML ( data manipulation language )
 -- insert 
 
 -- update set col = value  
 SET SQL_SAFE_UPDATES = 0;
 update actor_cp set newsalary = 900 ;
 SELECT * FROM ACTOR_CP;
 
 -- for specific column
 update actor_cp set newsalary = 10000 where fname ='uma';
 select * from actor_cp;
 
 
 
 