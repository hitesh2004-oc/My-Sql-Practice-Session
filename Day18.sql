-- Data Type in SQL
-- Numeric -> int ,Float, Decimal
-- Tinyint , medium, Big int ,small int,int
-- 1 byte, small -> 2 byte, medium -> 3, int -> 4 byte, big int -> 9 byte
-- 1 byte -> 8 bit (2**8) => 256

use regex;
-- Also add nagative and poitive[-128 to 127]
create table trail(id tinyint);
insert into trail values(1),(-128),(127);
insert into trail values(128); -- Error
select * from trail;
-- Positive 255
create table trail1(id tinyint unsigned); 
insert into trail1 values(1),(-128),(127); -- Error
insert into trail1 values(129),(255);
select * from trail1;

create table trail2(price float); 
insert into trail2 values(912.212),(12.989201);
select * from trail2;

create table trail3(price double); 
insert into trail3 values(912.212),(12.989201);
select * from trail3;

-- Define Length
create table trail4(price double(5,2));

insert into trail4 values(98.1);
insert into trail4 values(98.13);
insert into trail4 values(98.1882);
insert into trail4 values(9832.147); -- Error[precision and Scale]
select * from trail4;

-- Varchar and Char[0 to 255]
-- Varchar is Datatype => String / Character Values
-- Char => Character but of Fix length of Character

create table trail5(name char(10));
insert into trail5 values('abc'); -- char 3
insert into trail5 values('abcdjasxiisn'); -- Error char outOf Range(10)
insert into trail5 values('汉字');
select * from trail5;




















