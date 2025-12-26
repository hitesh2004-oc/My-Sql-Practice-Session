use regex;
show tables;
select * from customers;
select * from world.country;

-- Using Case
select name,population,
case
 when population = 0 then 'No Population'
 when population <= 20000 then 'Small Population'
 when population >20000 and population <40000 then 'Normal Population'
 else 'Large Population'
 end as Status from world.country;
 
 use world;
 Select 
 case 
 when  Population>100000 then 'Large Pop'
 when Population<100000 and Population>50000 then 'Normal Pop'
 when Population <50000 and Population>20000 then 'Lower Pop'
 when Population<20000 and Population>10000 then 'small Pop'
 when Population<8000 and Population>0 then 'lowest Pop'
 else 'No Pop'
 end as Status 
 from country group by Status;
 
 -- Case with Aggregate functin and Griup by
 select continent,
 sum(case 
 when population > 50000 then 1 else 0
 end) as status
 from country group by continent;
 
 
 