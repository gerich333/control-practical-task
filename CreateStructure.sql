create database dbo;
use dbo;

create table SKU (
	ID int identity primary key
	,Code as 's' + ID unique
	,Name nvarchar(30)
);