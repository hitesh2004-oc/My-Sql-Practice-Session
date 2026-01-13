create database Sqltest;
use Sqltest;
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Price INT
);
INSERT INTO Books VALUES
(1, 'The Alchemist', 'Paulo Coelho', 300),
(2, '1984', 'George Orwell', 250),
(3, 'To Kill a Mockingbird', 'Harper Lee', 400),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 350),
(5, 'Moby Dick', 'Herman Melville', 450);

CREATE TABLE BookRecords (
    Record_ID INT PRIMARY KEY,
    Book_ID INT,
    BorrowerName VARCHAR(50),
    BorrowDate DATE,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

INSERT INTO BookRecords VALUES
(101, 1, 'Alice', '2022-01-10'),
(102, 2, 'Bob', '2022-01-12'),
(103, 3, 'Charlie', '2022-01-15'),
(104, 1, 'Diana', '2022-02-01'),
(105, 4, 'Alice', '2022-02-05'),
(106, 5, 'Ethan', '2022-02-20'),
(107, 2, 'Frank', '2022-03-01'),
(108, 3, 'Alice', '2022-03-05'),
(109, 4, 'Bob', '2022-03-10'),
(110, 1, 'Charlie', '2022-03-15');

SELECT b.title, COUNT(br.record_id) AS borrow_count
FROM Books b
JOIN BookRecords br ON b.book_id = br.book_id
GROUP BY b.title;

SELECT b.title
FROM Books b
JOIN BookRecords br ON b.book_id = br.book_id
GROUP BY b.title
HAVING COUNT(br.record_id) > 2;

SELECT DISTINCT br.borrowername
FROM BookRecords br
JOIN Books b ON br.book_id = b.book_id
WHERE b.price > (SELECT AVG(price) FROM Books);

SELECT br.borrowername, SUM(b.price) AS total_value
FROM BookRecords br
JOIN Books b ON br.book_id = b.book_id
GROUP BY br.borrowername;

SELECT DISTINCT b.title, b.price
FROM Books b
JOIN BookRecords br ON b.book_id = br.book_id
WHERE b.price = (SELECT MAX(price) FROM Books);

SELECT b.title, MAX(br.borrowdate) AS latest_borrow_date
FROM Books b
JOIN BookRecords br ON b.book_id = br.book_id
GROUP BY b.title;

SELECT br.borrowername
FROM BookRecords br
JOIN Books b ON br.book_id = b.book_id
GROUP BY br.borrowername, b.author
HAVING COUNT(*) > 1;