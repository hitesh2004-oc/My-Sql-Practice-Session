-- Group by --
use world;

-- same select colunm as group by use --
select region, count(name) from country group by region;

select district, count(name) as TotalCity from city group by district;

-- 'Where' Execute First than 'Group By' and than 'Count()' Function --
select district, count(name) from city where population > 100000 group by district;

select * from country;
select count(name) from country where continent = 'asia' and indepyear>1950;

-- get total number country which got indepyear after 1950 in continent--
select continent,count(name) from country where indepyear > 1950 group by continent;

-- where only filter data which are available on the original table -- 
-- where and having clause --
-- where use for filter the data on tables --
-- Other having use to filter data on aggregate column(it is based on sum ,count & max) --
select continent,sum(population) from country group by continent having sum(population) > 100;

select continent,sum(population) from country where lifeexpectancy>35.0 group by continent;

-- you need to find out the total country for each goverform where total number of country > 30 --
select governmentform,count(name)  from country  group by governmentform having count(name) > 30;

--  you need to find  out the total country for each goverform only for the country having their capital > 30 and total pop>300000 --
select governmentform,count(name),sum(population) from country where capital > 30 group by governmentform having sum(population) > 300000;

-- Sub Grouping in Group by data -- 
select continent,count(name) from country group by continent;
select continent,region,count(name) from country group by continent, region;