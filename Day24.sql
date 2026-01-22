use world;
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;

select * from events;
select * from ticket_sales;

-- find the total quentity sold per event_id 
select event_id , sum(qty)  
from ticket_sales group by event_id;

-- find the total revenue per event_id 
select event_id , sum(price_per_ticket) 
from ticket_sales group by event_id;

-- find monthly total revenue 
select month(sale_date) , sum(price_per_ticket) 
from ticket_sales group by month(sale_date);

-- q1 find the maximum price per ticket per event id;
select event_id , max(price_per_ticket) 
from ticket_sales group by event_id;

-- find total revenue per month and ticket_type 
select month(sale_date) , ticket_type ,  sum(price_per_ticket)  
as month_revenue from ticket_sales  group by month(sale_date) , ticket_type  ;

-- list all sales sale_id , event_name , sale_date (event primary column -> event_id ) (sale forign key -> event_id)

select  s.sale_id , e.event_name , s.sale_date from events as e
join ticket_sales as s 
on e.event_id = s.event_id;

-- show enent_name , ticket_type and qty for each sale ;
select e.event_name , s.ticket_type , s.qty from events as e 
join ticket_sales as s 
on e.event_id = s.event_id;

-- show sales where the event city is mumbai ; sale_id  , event_name , city , sale_date 
select s.sale_id , e.event_name , e.city , s.sale_date from events as e 
join ticket_sales as s 
on e.event_id = s.event_id 
where e.city = 'mumbai';

-- show all events and matching sales -- event_name , sale_id , sale_date 
select e.event_name , s.sale_id , s.sale_date from events as  e
join ticket_sales as s
on e.event_id = s.event_id ; 

-- show distinct event namw that having at least one sale .
select distinct(e.event_name) from events as e 
join ticket_sales as s 
on e.event_id = e.event_id 
where sale_id >=1 ;

-- Show each sale’s computed revenue with event name. sale_id event_name revenue
select s.sale_id , e.event_name , s.price_per_ticket as revenue from events as e 
join ticket_sales as s 
on e.event_id = s.event_id ;

-- Find total quantity per event_name.
select e.event_name , sum(s.qty) as total_qty from events as e
join ticket_sales as s 
on e.event_id = s.event_id 
group by e.event_name;

-- Find total VIP revenue per event_name.
select e.event_name , sum(s.price_per_ticket) from events as e 
join ticket_sales as s 
on e.event_id = s.event_id 
where s.ticket_type = 'vip' group by e.event_name;

-- Find monthly revenue per city. city sale_month total_revenue
select e.city , month(s.sale_date) as sale_month , s.price_per_ticket as monthly_revenue from events as e 
join ticket_sales as s 
on e.event_id = s.event_id ;

-- Find total quantity per city and ticket_type.
select e.city , s.ticket_type , s.qty as total_qty from events as e 
join ticket_sales as s 
on e.event_id = s.event_id;

-- Find sales that happened on the latest sale_date in the table.
select * from ticket_sales where sale_date = ( select max(sale_date) from ticket_sales );

-- Find sales where revenue is greater than the overall average sale revenue. sale_id event_id revenue

select sale_id , event_id , price_per_ticket  from ticket_sales 
where price_per_ticket > (  select avg(price_per_ticket)  from ticket_sales );

-- Find events that have at least one VIP sale.

select * from ticket_sales;
 
select e.event_id , e.event_name  from events as e 
join ticket_sales as s 
on e.event_id = s.event_id 
where ticket_type = 'vip';

select e.event_id , e.event_name  , e.city from events as e 
join ticket_sales as s 
on e.event_id = s.event_id 
where ticket_type = 'vip';

select * from ticket_sales;
-- Find events that have at least one sale in February 2025. event_id event_name city
select event_id , event_name , city from events where event_id 
in ( select event_id from ticket_sales where sale_date >= '2025-02-01' and sale_date <= '2025-02-28');

-- For each event, return the highest price_per_ticket sale row.
select e.event_name , max(s.price_per_ticket) from events as e 
 join ticket_sales as s 
on e.event_id = s.event_id 
group by event_name ;

-- Show monthly total revenue and monthly total quantity, but only include months where total revenue is at least 10,000. sale_month total_qty total_revenue

select month(sale_date) , sum(price_per_ticket) as total_revenue , sum(qty) as total_qty
 from ticket_sales group by month(sale_date) having total_revenue >= 8000;

-- Show month-wise count of sales rows, but only include months that have at least 3 sales rows. sale_month sales_rows
select month(sale_date) , count(*) as sales_row from ticket_sales group by month(sale_date) having sales_row >=3; 

-- Show average revenue per sale row per month, but only include months where average sale revenue is above 4000. sale_month avg_sale_revenue

select month(sale_date) as sale_month , avg(price_per_ticket)  as avg_sale_revenue 
from ticket_sales group by sale_month having avg_sale_revenue > 3000 ; 

-- Show revenue per month and ticket_type, but only include groups where total revenue is at least 5000. sale_month ticket_type total_revenue

select month(sale_date) as sale_month , ticket_type , sum(price_per_ticket) as total_revenue 
from ticket_sales group by sale_month having total_revenue >= 5000;
