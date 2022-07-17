-------UC1-------
CREATE DATABASE PAYROLL_SERVICE

-------UC2-------
CREATE TABLE Employee_Payroll(
Id int identity(1,1) PRIMARY KEY,--first 1=it should be start with first row and second indicate 1=increment by 1---
Name varchar(200),
Salary float,
StartDate datetime
);