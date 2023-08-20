create database dbo;
use dbo;

create table SKU (
	ID int identity primary key
	,Code as 's' + ID unique
	,Name nvarchar(30)
);


create table Family (
	ID int identity(1,1) Primary key
	,SurName varchar(50)
	,BudgetValue money
);