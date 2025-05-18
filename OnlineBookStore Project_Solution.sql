-- 1) Retrieve all books in the "Fiction" genre:
SELECT * 
FROM BOOKS
WHERE GENRE = "Fiction";


-- 2) Find books published after the year 1950:
SELECT * 
FROM BOOKS
WHERE Published_Year = 1950;

-- 3) List all customers from the Canada:
SELECT * 
FROM CUSTOMERS
WHERE COUNTRY = "Canada";

-- 4) Show orders placed in November 2023:
SELECT * 
FROM ORDERS
WHERE ORDER_DATE BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT 
SUM(STOCK) AS TOTALSTOCK
FROM BOOKS;

-- 6) Find the details of the most expensive book:
SELECT *
FROM BOOKS
ORDER BY PRICE DESC;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * 
FROM ORDERS
WHERE QUANTITY >1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM ORDERS
WHERE TOTAL_AMOUNT > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT
GENRE
FROM BOOKS;

-- 10) Find the book with the lowest stock:
SELECT * FROM BOOKS
ORDER BY STOCK ASC
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(TOTAL_AMOUNT)
FROM ORDERS;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
SELECT
b.GENRE,
SUM(a.QUANTITY)
FROM ORDERS AS a
	JOIN BOOKS AS b
    ON a.BOOK_ID = b.BOOK_ID
GROUP BY b.GENRE;



-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(PRICE)
FROM BOOKS
WHERE GENRE ="Fantasy";


-- 3) List customers who have placed at least 2 orders:
SELECT
Customer_ID,
Count(ORDER_ID) AS COUNT
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) >= 2;

-- 4) Find the most frequently ordered book:
SELECT O.BOOK_ID, B.TITLE, COUNT(O.ORDER_ID) AS ORDER_COUNT
FROM ORDERS AS O
JOIN BOOKS AS B ON O.BOOK_ID=B.BOOK_ID
GROUP BY O.BOOK_ID, B.TITLE
ORDER BY ORDER_COUNT DESC LIMIT 1;



-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * FROM BOOKS
ORDER BY PRICE DESC
LIMIT 3 ;



-- 6) Retrieve the total quantity of books sold by each author:
SELECT
	B.AUTHOR,
	SUM(O.QUANTITY)AS TOTAL_BOOKS_SOLD
FROM ORDERS AS O
	JOIN BOOKS AS B 
	ON O.BOOK_ID = B.BOOK_ID
GROUP BY B.AUTHOR ;
    

-- 7) List the cities where customers who spent over $30 are located:
SELECT 
C.CITY,
O.TOTAL_AMOUNT
FROM ORDERS AS O
	JOIN CUSTOMERS AS C
    ON O.CUSTOMER_ID = C.CUSTOMER_ID
WHERE O.TOTAL_AMOUNT > 30 ;


-- 8) Find the customer who spent the most on orders:
SELECT
	C.NAME,
    SUM(O.TOTAL_AMOUNT)
FROM ORDERS AS O
	JOIN CUSTOMERS AS C
    ON O.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.NAME
ORDER BY SUM(O.TOTAL_AMOUNT) DESC LIMIT 1 ;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT
	B.BOOK_ID,
    B.TITLE,
    B.STOCK AS STOCK_IN_HAND,
    COALESCE(SUM(QUANTITY),0) AS ORDER_QUANTITY,
    B.STOCK- COALESCE(SUM(QUANTITY),0) AS REMAINING_QUANTITY
FROM 
BOOKS AS B
	LEFT JOIN ORDERS AS O
    ON B.BOOK_ID = O.BOOK_ID
GROUP BY B.BOOK_ID,B.STOCK,B.TITLE
ORDER BY B.BOOK_ID ;

    
    
    





