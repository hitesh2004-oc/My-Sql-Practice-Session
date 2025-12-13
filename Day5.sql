show databases;
use world;
show tables;
select * from country;
-- Numeric Function, Dates --
select lifeexpectancy , round(lifeexpectancy) from country;
select round(83.65, 1);

-- one place(-1) tenth place(-2) & hundred place(-3) --
select 46.93,round(233.2,-2);

-- Use of Truncate function --
select 448.82, round(448.85,1),truncate(448.82,1);

-- Use of Mod,Pow --
select mod(47,3);
select pow(2,3);

-- Uses of Ceil & Floor --
select ceil(3.000002);
select floor(3.999999);

-- Date
-- Inbuilt date ya data and Time Print Krna --
-- now and timestamp are Same --
Select now(), curdate(), current_timestamp(), current_time();

-- Add Date --
select now(), adddate(now() ,2);
select now(), adddate(now(), interval 2 month);
-- use for Subtract date --
select now(), subdate(now() ,2);

select now(), year(now());

-- Extract is Use for extract year, month, day, week --
select now(),extract( year from now());

-- uses of Date Format --
-- show current Month,Year,Week,date in Format --
select now(), date_format(now() , "Month is %M & year is %Y");


