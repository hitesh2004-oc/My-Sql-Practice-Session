-- Operator in Sql --
-- AND ,OR

select * from country where continent;

-- Function --
/*
Set of Statement
Function
code Reusuable 

Scaler function - Row by Row(Result for Each Row)
Multi line function ->multiple line pr apply and gave 1 output
scaler can apply : Date, Int , float , string
*/
use world;
select name , continent, concat(continent,' ',code,'-','Regex') from country;
-- Concat with Sperate --
select name , continent , concat_ws('-',name,code) from country;

-- Substring (substr) => Character extract based on the Position --
select name,substr(name,3) from country;
select name,substr(name,3,6) from country; 
select name,substr(name,-3,6) from country; 
-- we can use this function with select and where
select name,substr(name,1,1), substr(continent,1,1) from country where "alg" = substr(name,1,3);

-- instr => search positon of character --
select name,instr(name,'r') from country;

-- length (byte use hua) --
select length(' yash');

-- To get Total Character --
select char_length(' yash');
select name,char_length(name) from country;
-- trim (extra white space ya fir character ko remove krna) --
-- ltrim and rtrim --
select trim('    yash   ');
select char_length(trim('     yash     '));
select trim(both 'g' from 'ggggyashgggggg');
select name, trim(both 'A' from name) from country;

-- lpad and rpad --
select name,population, lpad(population, 9, '0') from country;





