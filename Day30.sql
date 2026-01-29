-- DCL
-- permission which user can accessbility 
-- authentatication and authorization 
-- user --> create --> permission 
-- ddl statement 

create user regex identified by 'regex';

drop database hiteshDB;
create database hiteshDB;
show grants for regex;
create table actor1 as
select actor_id , first_name from sakila.actor where actor_id between 1 and 5;
select * from actor1;
grant select on hiteshDB.* to regex;

GRANT ALL PRIVILEGES on hiteshDB.actor1 to regex;
show grants for regex; 


-- what is roll ?
-- give the privileges for 1 or 2 column 
-- select or delete ka privileges 
-- try to revoke those privileges alter