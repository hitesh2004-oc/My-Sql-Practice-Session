-- create a role add a user give a permission 
--  inside a group you have to add a user 
--   INDEX  --
-- indexes in sql --> it is like a data structure which is used to access your data in a faster way 
-- types of index -- > clustered index and non clusterred index 
-- there is only one clustered column in a table `
use sakila;
create table test100 as select actor_id , first_name from actor where actor_id between 1 and 10;
select * from test100;
desc test100;
explain select * from test100 where actor_id = 5;

-- alter statement 
alter table test100 add primary key (actor_id);
alter table test100 drop  primary key ;
explain select * from test100 where actor_id = 5;

insert into test100 values (14,'abc'),(13,'def'),(11,'aman'),(12,'shubham');
create index  index1 on test100(actor_id);
show index from test100; 
insert into test100 values(12,'abc');
explain select * from test100 where actor_id =5;

drop index index1 on test100;

-- index on 2 colum 
create index indx_composite on test100(actor_id , first_name);
show index from test100;

Explain select * from test100 where first_name = 'abc';

insert into test100 values(15,'john'),(16,'johi'),(17,'johram'),(18,'johnex');
select * from test100;

drop index indx_composite on test100;
show index from test100;

-- partial index 

create index indx_name on test100(first_name(3));
show index from test100;

EXPLAIN select * from test100 where first_name like 'joh%';

-- index ke bare me padna 