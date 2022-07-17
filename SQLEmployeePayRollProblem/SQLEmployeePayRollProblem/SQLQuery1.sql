-------UC1-------
CREATE DATABASE PAYROLL_SERVICE

-------UC2-------
CREATE TABLE Employee_Payroll(
Id int identity(1,1) PRIMARY KEY,--first 1=it should be start with first row and second indicate 1=increment by 1---
Name varchar(200),
Salary float,
StartDate datetime
);
---------to insert data into the table UC3--------------
INSERT INTO employee_payroll
VALUES('Kalpak',50002,'2008-02-02','M'),('Sourav',50003,'2011-04-01','M');

INSERT INTO employee_payroll(Name,StartDate)
VALUES('Abhishek','2020-02-02'),('Hitesh','2019-07-01');
-----retrive data UC4---------
SELECT * FROM  employee_payroll;--to retrive all the data---------
SELECT Id,Name FROM  employee_payroll;------to retrive id and name-----------
--------UC5 retrive accoring to data and particular employee-----
SELECT * FROM  employee_payroll where Name='Singh' or Name='Gurpreet';
----------to get the d/f colum-------
SELECT * FROM  employee_payroll where Name='Singh' or Salary=50001;

----------------UC5 retrive according to the start date range-------------
SELECT * FROM  employee_payroll where StartDate between CAST('2019-04-01' as date) and GETDATE();