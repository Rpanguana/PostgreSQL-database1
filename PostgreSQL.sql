PART 1: CREATING A DATABASE

1.
 docker run --name umuzi -e POSTGRES_PASSWORD=Password -d postgres

 docker exec -it umuzi psql -U postgres

 CREATE DATABASE umuzi;


2. && 3 && 4.
 \c umuzi;
 CREATE TABLE customers(
 CustomerID SERIAL PRIMARY KEY,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Gender VARCHAR(20),
 Address VARCHAR(200),
 Phone BIGINT,
 Email VARCHAR(100),
 City VARCHAR(20),
 Country VARCHAR(50));

 CREATE TABLE employees(
 employeeID SERIAL PRIMARY KEY,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 email VARCHAR(100),
 JobTitle VARCHAR(20));

 CREATE TABLE Payments(CustomerID integer REFERENCES Customers(CustomerID),
 PaymentID SERIAL PRIMARY KEY,
 PaymentDate TIMESTAMP,
 Amount DECIMAL);

 CREATE TABLE products(
 productID SERIAL PRIMARY KEY,
 productName VARCHAR(100),
 description VARCHAR(300),
 buyPrice DECIMAL);

 CREATE TABLE orders(
 orderID SERIAL PRIMARY KEY,
 productID integer REFERENCES products(productID),
 PaymentID integer REFERENCES payments(PaymentID),
 fulfilledByEmployeeID integer REFERENCES employees(employeeID),
 DateRequired TIMESTAMP,
 DateShipped TIMESTAMP,
 Status VARCHAR(20));


-- 4.
--  CREATE TABLE Payments(CustomerID integer REFERENCES Customers(CustomerID), PaymentID SERIAL PRIMARY KEY, PaymentDate TIMESTAMP, Amount DECIMAL);


5.
 INSERT INTO customers values(1, 'John', 'Hilbert', 'Male', '284 chaucer st', '084789657', 'john@gmail.com', 'Johannesburg', 'South Africa');
 INSERT INTO customers values(2, 'Thando', 'Sithole', 'Female', '240 Sect 1', '0794445584', 'thando@gmail.com', 'Cape Town', 'South Africa');
 INSERT INTO customers values(3, 'Leon', 'Glen', 'Male', '81 Everton Rd,Gillits', '0820832830', 'Leon@gmail.com', 'Durban', 'South Africa');
 INSERT INTO customers values(4, 'Charl', 'Muller', 'Male', '290A Dorset Ecke', '+44856872553', 'Charl.muller@yahoo.com', 'Berlin', 'Germany');
 INSERT INTO customers values(5, 'Julia', 'Stein', 'Female', '2 Wernerring', '+448672445058', 'Js234@yahoo.com', 'Frankfurt', 'Germany');

 INSERT INTO employees values(1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');
 INSERT INTO employees values(2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');
 INSERT INTO employees values(3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

 INSERT INTO Orders values(1, 1, 1, 2, 05-09-2018, DEFAULT, 'Not Shipped');
 INSERT INTO Orders values(2, 1, 2, 2, 04-09-2018, 03-09-2018, 'Shipped');
 INSERT INTO Orders values(3, 3, 3, 3, 06-09-2018, DEFAULT, 'Not Shipped');
 
 INSERT INTO Payments values(1, 1, 01-09-2018, 150.75);
 INSERT INTO Payments values(5, 2, 03-09-2018, 150.75);
 INSERT INTO Payments values(4, 3, 03-09-2018, 700.60);

INSERT INTO Products values(1, "Harley Davidson Chopper", "This replica features working kickstand, front suspension, gear-shift lever", 150.75);
INSERT INTO Products values(2, "Classic Car", "Turnable front wheels, steering function", 550.75);
INSERT INTO Products values(3, "Sports car", "Turnable front wheels, steering function", 700.60);


   
 SELECT * FROM Customers;



............................................................................
PART 2: Querying a database.

1.
         SELECT * FROM Customers;


2.
         SELECT firstname, lastname FROM Customers;

        
3.
         SELECT firstname, lastname FROM Customers WHERE customerId = 1;


4.
         UPDATE Customers SET firstname = 'Lerato', lastname = 'Mabitso' WHERE customerid = 1;


5.
         DELETE FROM Customers WHERE customerid = 2;


6.
         SELECT COUNT(DISTINCT Status) FROM Orders;


7.
         SELECT MAX(Amount) FROM Payments;


8.
         SELECT * FROM Customers ORDER BY Country;


9.
         SELECT * FROM Products WHERE buyprice BETWEEN 100 AND 600;


10.
         SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin';


12.
         SELECT * FROM Products WHERE BuyPrice > 500;


13.
         SELECT SUM(Amount) FROM Payments;


14.
         SELECT COUNT(status) FROM Orders WHERE status='shipped';


15.
         SELECT AVG(BuyPrice / 12) FROM Products;


16.
         SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Gender, Customers.Address, Customers.Phone, Customers.Email, Customers.Country, Customers.City FROM Customers
        INNER JOIN Payments ON Payments.CustomerID=Customers.CustomerID;


17.
         SELECT * FROM Products WHERE description > 'Turnable front wheels steering function';