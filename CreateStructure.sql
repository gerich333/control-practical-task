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


create table Basket (
	ID int identity(1,1) Primary key
	,ID_SKU int not null
	,ID_Family int not null
	,Quantity int 
	,Value int
	,PurchaseDate date default CONVERT (date,GETDATE())
	,DiscountValue smallmoney check (DiscountValue >= 0)

	,CONSTRAINT check_Q_and_V CHECK (Quantity>=0 AND Value>=0)

	,foreign key (ID_SKU) references dbo.SKU(ID) on update cascade on delete cascade
	,foreign key (ID_Family) references dbo.Family(ID) on update cascade on delete cascade
);
