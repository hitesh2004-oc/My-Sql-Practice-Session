CREATE DATABASE hotel_management;
use hotel_management;
select * from users where password = '$2a$10$bbiswtzgSkj0O.f4Ox/U1eHIaRpRs0GFmNeL87/Jj0I9.dDLSQS4i';
show tables;
UPDATE Users
SET role = 'ADMIN'
WHERE id = 1;

UPDATE users
SET role='ADMIN'
WHERE email='admin@gmail.com';

select * from users;
DESC users;
ALTER TABLE users
MODIFY role ENUM('USER','ADMIN');

ALTER TABLE users
MODIFY role VARCHAR(50);

UPDATE users
SET role='ADMIN'
WHERE role='ROLE_USER';

UPDATE users
SET role='USER'
WHERE role='ROLE_USER';

SET SQL_SAFE_UPDATES = 0;

UPDATE users
SET role='USER'
WHERE role='ROLE_USER';
use hotel_management;
select * from users;
select * from bookings;
select * from rooms;
show tables;
DROP TABLE users;
DROP TABLE rooms;
DROP TABLE bookings;