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
------------UC6-we have to add the other column as a gender to existing table------------
ALTER TABLE employee_payroll
ADD Gender char(1); 
UPDATE employee_payroll set Gender='M';
UPDATE employee_payroll set Salary=60000 where Name='Gurpreet';
UPDATE employee_payroll set Salary=60001,StartDate=getdate() where Name='Gurpreet';
UPDATE employee_payroll set Salary=60001 where Name='Abhishek';
UPDATE employee_payroll set Salary=60001 where Name='Kalpak';
------------UC7-sum,avrage,min,max,count-------------------
SELECT * FROM  employee_payroll;
SELECT SUM(Salary) as TotalSalary from employee_payroll;
SELECT avg(Salary) as AvergeSalary from employee_payroll;
SELECT  MIN(Salary) as MINIMUMSalary from employee_payroll;
SELECT MAX(Salary) as MaximumSalary from employee_payroll;
SELECT COUNT(Salary) from employee_payroll;

------TO GET THE MINIMUM SALARY WITH MINIMUM SALARY------------
SELECT * FROM employee_payroll Salary where
 Salary=(select min(Salary)as MINIMUMSALARY FROM employee_payroll);

 SELECT * FROM employee_payroll Salary where
 Salary=(select MAX(Salary)as MAXIMUMSALARY FROM employee_payroll);

 SELECT Name,StartDate FROM employee_payroll Salary where
 Salary=(select MAX(Salary)as MAXIMUMSALARY FROM employee_payroll);

 --------TO count the male and female separetly to all the employee-------
 SELECT COUNT(Salary)  from employee_payroll group by gender;
 -----------we aslo displaying the gender column-------------
 SELECT COUNT(Salary) as generCount,gender from employee_payroll group by gender;
  --------TO count the male and female separetly to particular the employee-------
--------UC8-Extending the table bye by adding dept,phonr,address columns---------
ALTER TABLE employee_payroll
ADD PhoneNumber bigint;
 --while adding not null we have to pass default values because we are altering it----------
ALTER TABLE employee_payroll
ADD Department varchar(200)NOT NULL default'HR';
 
select * from employee_payroll;

ALTER TABLE employee_payroll
ADD Address varchar(200) default 'Bengaluru';
-------------UC9 Extend the employee table----------------
ALTER TABLE employee_payroll ADD BasicSalary float,Deductions float,TaxablePay float,IncomeTax float,NetPay float;
--------------UC10 ability to make same employee for the two different department-----------
SELECT* FROM  employee_payroll;
UPDATE employee_payroll set Department='Sales', Address ='Bengaluru',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Gurpreet';
UPDATE employee_payroll set Department='Marketing', Address ='Bengaluru',BasicSalary=456796, Deductions=300,TaxablePay=2000 where Name='Abhishek';
UPDATE employee_payroll set Department='HR',Address ='Bengaluru',BasicSalary=356786, Deductions=270,TaxablePay=3000 where Name='Kalpak';
UPDATE employee_payroll set Department='Marketing',Address ='Bengaluru',BasicSalary=459786, Deductions=280,TaxablePay=3000 where Name='Viswas';
UPDATE employee_payroll set Department='Sales', Address ='Bengaluru',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Ganesh';
UPDATE employee_payroll set Department='Sales', Address ='Bengaluru',BasicSalary=456786, Deductions=200,TaxablePay=3000 where Name='Sailesh';
-----INSERTING ONE MORE ROW WITH SAME EMPLOYEE DETAILS-----------------

INSERT INTO employee_payroll(Name,Salary,StartDate,Gender,PhoneNumber,Department,Address,BasicSalary,Deductions,TaxablePay,IncomeTax,NetPay)
VALUES('Ganesh',50002,'2008-02-02','M',5436787654,'Marketing','Mysore',4567860,200,3000,8765,600000);
-------UC11-creating the new tables for many to many relation-----------------
SELECT* FROM  EmployeeDept;
CREATE TABLE EmployeeDept(
DeptId int identity(1,1) PRIMARY KEY,

EmployeeID int FOREIGN KEY REFERENCES employee_payroll(Id));
SELECT* FROM  EmployeeDept;
INSERT INTO EmployeeDept(EmployeeID) values(1);
INSERT INTO EmployeeDept(EmployeeID) values(2);
INSERT INTO EmployeeDept(EmployeeID) values(3);
INSERT INTO EmployeeDept(EmployeeID) values(4);
INSERT INTO EmployeeDept(EmployeeID) values(5);
INSERT INTO EmployeeDept(EmployeeID) values(6);
INSERT INTO EmployeeDept(EmployeeID) values(7);

create table payroll
(
	Payroll_ID int not null primary key,
	Basic_Pay money not null,
	Deduction float not null,
	Taxable real, 
	Income_Tax float,
	Netpay real, 
)

insert into payroll values
	(111,400000,200.20,2000,50000,25000),
	(112,500000,600.20,3000,70000,55000),
	(113,500000,600.20,3000,70000,55000),
	(114,700000,9900.10,4000,80000,56000)

select *from payroll

create table Company
(
	Company_ID int primary key,
	ComapnyName varchar(20)
)

insert into Company values
	(501,'Tcs'),
	(502,'Baracudda'),
	(503,'Cognizant'),
	(504,'Dell')

select * from Company

create table Employee
(
	Employee_ID int not null primary key,
	Name varchar(20) not null,
	Gender varchar(1) not null,
	Basic_pay money not null,
	StartDate date not null,
	PhoneNumber varchar(10),
	Addres varchar(60),
	CompanyEmployeeID int FOREIGN KEY REFERENCES Company(Company_ID),
	PayrolID int FOREIGN KEY  REFERENCES Payroll(Payroll_ID)
)

insert into Employee values
	(001,'Gurpreet','M',700000,'2019-07-13','7894561230','Port Blair',501,111),
	(002,'Ganesh','M',800000,'2020-08-05','8975833278','SriLanka',502,112),
	(003,'Johnny','M',600000,'2019-08-09','8874563210','Delhi',503,113),
	(004,'Prakash','M',900000,'2018-07-05','8638527410','Haryana',504,114);

select * from Employee
