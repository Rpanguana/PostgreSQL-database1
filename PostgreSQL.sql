PART 1: CREATING A DATABASE

1.Create a database called “Umuzi”:
~$ docker run --name umuzi -e POSTGRES_PASSWORD=Rulani7778899 -d postgres
        eb6beee47baf23a669c26d8c665c455a66f169310f5ce518622d5743f421cd32

~$ docker exec -it umuzi psql -U postgres
        psql (12.0 (Debian 12.0-2.pgdg100+1))
        Type "help" for help.

=# CREATE DATABASE umuzi;
        CREATE DATABASE

...................................................

2.Create the following tables in the Umuzi database: 
&&
3.Create a primary key for each table with auto increment (make sure you correctly specify the data types , e.g
the ID field should be int ):

    Customers  **
    Employees
    Orders
    Payments
    Products

=# \c umuzi;
            You are now connected to database "umuzi" as user "postgres".

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

...................................................

4.Create foreign keys so that every ID in the order table references an existing ID in the tables referenced
(e.g ProductID, EmployeeID etc.):

=# CREATE TABLE Payments(CustomerID integer REFERENCES Customers(CustomerID), PaymentID SERIAL PRIMARY KEY, PaymentDate TIMESTAMP, Amount DECIMAL);
        CREATE TABLE


5.INSERT the records in the tables below into the table you created in step 2:

=# INSERT INTO customers values(1, 'John', 'Hilbert', 'Male', '284 chaucer st', '084789657', 'john@gmail.com', 'Johannesburg', 'South Africa');
        INSERT 0 1        

                                     /* EXAMPLE OF TABLE CUSTOMERS */

=# SELECT * FROM Customers;
 customerid | firstname | lastname | gender |        address        |    phone     |         email          |     city     |   country    
------------+-----------+----------+--------+-----------------------+--------------+------------------------+--------------+--------------
          1 | John      | Hilbert  | Male   | 284 chaucer st        |     84789657 | john@gmail.com         | Johannesburg | South Africa
          2 | Thando    | Sithole  | Female | 240 Sect 1            |    794445584 | thando@gmail.com       | Cape Town    | South Africa
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits |    820832830 | Leon@gmail.com         | Durban       | South Africa
          4 | Charl     | Muller   | Male   | 290A Dorset Ecke      |  44856872553 | Charl.muller@yahoo.com | Berlin       | Germany
          5 | Julia     | Stein    | Female | 2 Wernerring          | 448672445058 | Js234@yahoo.com        | Frankfurt    | Germany
(5 rows)

6.Document what information is stored in your database. Be sure to say what information is kept in what table, 
and which keys link the records between tables:



PART 2: Querying a database.

1.SELECT ALL records from table Customers.

        =# SELECT * FROM Customers;

 customerid | firstname | lastname | gender |        address        |    phone  
   |         email          |     city     |   country    
------------+-----------+----------+--------+-----------------------+-----------
---+------------------------+--------------+--------------
          1 | John      | Hilbert  | Male   | 284 chaucer st        |     847896
57 | john@gmail.com         | Johannesburg | South Africa
          2 | Thando    | Sithole  | Female | 240 Sect 1            |    7944455
84 | thando@gmail.com       | Cape Town    | South Africa
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits |    8208328
30 | Leon@gmail.com         | Durban       | South Africa
          4 | Charl     | Muller   | Male   | 290A Dorset Ecke      |  448568725
53 | Charl.muller@yahoo.com | Berlin       | Germany
          5 | Julia     | Stein    | Female | 2 Wernerring          | 4486724450
58 | Js234@yahoo.com        | Frankfurt    | Germany
(5 rows)

2.SELECT records only from the name column in the Customers table.

        =# SELECT firstname, lastname FROM Customers;

 firstname | lastname 
-----------+----------
 John      | Hilbert
 Thando    | Sithole
 Leon      | Glen
 Charl     | Muller
 Julia     | Stein

(5 rows)

        
3.Show the name of the Customer whose CustomerID is 1.

        =# SELECT firstname, lastname FROM Customers WHERE customerId = 1;

 firstname | lastname 
-----------+----------
 John      | Hilbert
(1 row)


4.UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.

        =# UPDATE Customers SET firstname = 'Lerato', lastname = 'Mabitso' WHERE customerid = 1;

UPDATE 1

5.DELETE the record from the Customers table for customer 2 (CustomerID = 2).

        =# DELETE FROM Customers WHERE customerid = 2;

DELETE 1

6.Select all unique statuses from the Orders table and get a count of the number of orders 
for each unique status.

        =# SELECT COUNT(DISTINCT Status) FROM Orders;

 count 
-------
     2
(1 row)


7.Return the MAXIMUM payment made on the PAYMENTS table.

        =# SELECT MAX(Amount) FROM Payments;

  max   
--------
 700.60
(1 row)


8.Select all customers from the “Customers” table, sorted by the “Country” column.

        =# SELECT * FROM Customers ORDER BY Country;

 customerid | firstname | lastname | gender |        address        |    phone  
   |         email          |     city     |   country    
------------+-----------+----------+--------+-----------------------+-----------
---+------------------------+--------------+--------------
          4 | Charl     | Muller   | Male   | 290A Dorset Ecke      |  448568725
53 | Charl.muller@yahoo.com | Berlin       | Germany
          5 | Julia     | Stein    | Female | 2 Wernerring          | 4486724450
58 | Js234@yahoo.com        | Frankfurt    | Germany
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits |    8208328
30 | Leon@gmail.com         | Durban       | South Africa
          1 | Lerato    | Mabitso  | Male   | 284 chaucer st        |     847896
57 | john@gmail.com         | Johannesburg | South Africa
(4 rows)


9.Select all products with a price BETWEEN R100 and R600.

        =# SELECT * FROM Products WHERE buyprice BETWEEN 100 AND 600;

 productid |       productname       |                                 descripti
on                                 | buyprice 
-----------+-------------------------+------------------------------------------
-----------------------------------+----------
         1 | Harley Davidson Chopper | This replica features working kickstand, 
front suspension, gear-shift lever |   150.75
         2 | Classic car             | Turnable front wheels, steering function 
                                   |   550.75
(2 rows)


10.Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.

        =# SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin';

 customerid | firstname | lastname | gender |     address      |    phone    |         email          |  city  | country 
------------+-----------+----------+--------+------------------+-------------+------------------------+--------+---------
          4 | Charl     | Muller   | Male   | 290A Dorset Ecke | 44856872553 | Charl.muller@yahoo.com | Berlin | Germany
(1 row)


11.Select all fields from “Customers” where city is “Cape Town” OR “Durban”.

        =# SELECT * FROM Customers WHERE CITY = 'Cape Town' OR City = 'Durban';

 customerid | firstname | lastname | gender |        address        |   phone   |     email      |  city  |   country    
------------+-----------+----------+--------+-----------------------+-----------+----------------+--------+--------------
          3 | Leon      | Glen     | Male   | 81 Everton Rd,Gillits | 820832830 | Leon@gmail.com | Durban | South Africa
(1 row)


12.Select all records from Products where the Price is GREATER than R500.

        =# SELECT * FROM Products WHERE BuyPrice > 500;

 productid | productname |               description                | buyprice 
-----------+-------------+------------------------------------------+----------
         2 | Classic car | Turnable front wheels, steering function |   550.75
         3 | Sports Car  | Turnable front wheels, steering function |   700.60
(2 rows)

13.Return the sum of the Amounts on the Payments table.

        =# SELECT SUM(Amount) FROM Payments;

   sum   
---------
 1002.10
(1 row)


14.Count the number of shipped orders in the Orders table.

        =# SELECT COUNT(status) FROM Orders WHERE status='shipped';

 count 
-------
     1
(1 row)


15.Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12
 to the Dollar.

        =# SELECT AVG(BuyPrice / 12) FROM Products;

         avg         
---------------------
 38.9472222222222222
(1 row)


16.Using INNER JOIN create a query that selects all Payments with Customer information.

        =# SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Gender, Customers.Address, Customers.Phone, Customers.Email, Customers.Country, Customers.City FROM Customers
        INNER JOIN Payments ON Payments.CustomerID=Customers.CustomerID;

 customerid | firstname | lastname | gender |     address      |    phone     |         email          |   country    |     city     
------------+-----------+----------+--------+------------------+--------------+------------------------+--------------+--------------
          1 | Lerato    | Mabitso  | Male   | 284 chaucer st   |     84789657 | john@gmail.com         | South Africa | Johannesburg
          5 | Julia     | Stein    | Female | 2 Wernerring     | 448672445058 | Js234@yahoo.com        | Germany      | Frankfurt
          4 | Charl     | Muller   | Male   | 290A Dorset Ecke |  44856872553 | Charl.muller@yahoo.com | Germany      | Berlin
(3 rows)



17.Select all products that have turnable front wheels.

        =# SELECT * FROM Products WHERE description > 'Turnable front wheels steering function';

 productid | productname |               description                | buyprice 
-----------+-------------+------------------------------------------+----------
         2 | Classic car | Turnable front wheels, steering function |   550.75
         3 | Sports Car  | Turnable front wheels, steering function |   700.60
(2 rows)
