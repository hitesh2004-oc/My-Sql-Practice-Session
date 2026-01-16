-- ===== windows function ====== --
-- it is used to perform the caluclation on the set of rows with reference to current row  
-- it will apply aggregate function to each row 

-- three parts 
-- 1. over --> to apply the function over a window 
use world;
select code , name , continent , population , sum(population) over() , avg(population) over() from country ;

-- partition by  
-- > same as group by , which is used to apply the logic into group
select code , name  , population  , continent, sum(population) over(partition by code) from country ;

-- find out the running sum or cumulative sum 
-- use order by 
select code , name , population , continent, sum(population) over(order by population asc  ) from country ;