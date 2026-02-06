use sakila;
select * from customer;

select first_name,active,
case
  when active = 1 then 'Active Customer'
  when active = 0 then 'Inactive Customer'
end as ac
from customer;  

select * from film;
select title,
case
   when length<60 then 'Short Film'
   when length >=60 and length <= 120 then 'Meduim Film'
   when length > 120 then 'Long Film'
end as m
   from film;
   
select rating ,count(*) as total,
 case 
    when count(*)<200 then 'Low'
    when count(*) between 200 and 400 then 'Medium'
    else 'High'
  end as Count  
from film group by rating;

select * from payment;
select * from customer;

select p.customer_id,first_name ,sum(amount),
case 
   when sum(amount) < 90 then 'Low Spender'
   else 'High Spender'
   end as Spender
from payment as p join
customer as c on p.customer_id = c.customer_id 
group by p.customer_id;

select * from film;
select * from inventory;
select * from rental;

select f.title,count(rental_id) from film as f join inventory as i join rental as r on
f.film_id = i.film_id and i.inventory_id = r.inventory_id group by f.title;

select * from customer;
select * from payment;

select c.customer_id,first_name,sum(amount) from payment as p join customer as c on 
p.customer_id = c.customer_id group by c.customer_id,first_name;

select * from film;
select * from inventory;
select * from rental;
select f.title,count(rental_id) from film as f 
join inventory as i join rental as r on
f.film_id = i.film_id and i.inventory_id = r.inventory_id
 group by f.title ;

