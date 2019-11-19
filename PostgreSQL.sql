PART 1: CREATING A DATABASE

1.
~$ docker run --name umuzi -e POSTGRES_PASSWORD=Password -d postgres

~$ docker exec -it umuzi psql -U postgres

=# CREATE DATABASE umuzi;


2. && 3.
=# \c umuzi;
=# CREATE TABLE customers(
=# CustomerID SERIAL PRIMARY KEY,
=# FirstName VARCHAR(50),
=# LastName VARCHAR(50),
=# Gender VARCHAR(20),
=# Address VARCHAR(200),
=# Phone BIGINT,
=# Email VARCHAR(100),
=# City VARCHAR(20),
=# Country VARCHAR(50));
        CREATE TABLE


4.
=# CREATE TABLE Payments(CustomerID integer REFERENCES Customers(CustomerID), PaymentID SERIAL PRIMARY KEY, PaymentDate TIMESTAMP, Amount DECIMAL);


5.
=# INSERT INTO customers values(1, 'John', 'Hilbert', 'Male', '284 chaucer st', '084789657', 'john@gmail.com', 'Johannesburg', 'South Africa');
   
=# SELECT * FROM Customers;



............................................................................
PART 2: Querying a database.

1.
        =# SELECT * FROM Customers;


2.
        =# SELECT firstname, lastname FROM Customers;

        
3.
        =# SELECT firstname, lastname FROM Customers WHERE customerId = 1;


4.
        =# UPDATE Customers SET firstname = 'Lerato', lastname = 'Mabitso' WHERE customerid = 1;


5.
        =# DELETE FROM Customers WHERE customerid = 2;


6.
        =# SELECT COUNT(DISTINCT Status) FROM Orders;


7.
        =# SELECT MAX(Amount) FROM Payments;


8.
        =# SELECT * FROM Customers ORDER BY Country;


9.
        =# SELECT * FROM Products WHERE buyprice BETWEEN 100 AND 600;


10.
        =# SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin';


12.
        =# SELECT * FROM Products WHERE BuyPrice > 500;


13.
        =# SELECT SUM(Amount) FROM Payments;


14.
        =# SELECT COUNT(status) FROM Orders WHERE status='shipped';


15.
        =# SELECT AVG(BuyPrice / 12) FROM Products;


16.
        =# SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Gender, Customers.Address, Customers.Phone, Customers.Email, Customers.Country, Customers.City FROM Customers
        INNER JOIN Payments ON Payments.CustomerID=Customers.CustomerID;


17.
        =# SELECT * FROM Products WHERE description > 'Turnable front wheels steering function';