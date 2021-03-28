Create Database If not exists MyDatabase
go

Use MyDatabase;
Create table City
(
ID int IDENTITY(1, 1) not null PRIMARY KEY,
Name varchar(64) not null UNIQUE
)

Create table Locations
(
ID int IDENTITY(1, 1) not null PRIMARY KEY,
CityID int Foreign KEY
	References City (ID) not null,
Address varchar(64) not null
)

Create table Customer
(
ID int IDENTITY(1, 1) not null PRIMARY KEY,
FirstName varchar(64) not null,
MiddleName varchar(64) null,
LastName varchar(64) null,
Gender nchar(1) NOT NULL
    CONSTRAINT chk_Person CHECK (Gender in ('M', 'F')),
LocationID int not null Foreign KEY
	References Locations (ID)
)

Create table Currency
(
ID int IDENTITY(1, 1) not null PRIMARY KEY,
Name varchar(8) not null UNIQUE
)

Create table Product
(
ID int IDENTITY(1, 1) not null PRIMARY KEY,
Name varchar(64) not null,
Unit varchar(8) 
	DEFAULT('p.') not null,
Price money not null,
CurrencyID int Foreign KEY
	References Currency(ID) not null
)

Create Table Orders
(
ID int IDENTITY(1, 1) not null PRIMARY KEY,
CustomerID int not null Foreign KEY
	References Customer (ID),
TotalCost int not null
)

Create table OrderDetail
(
ID int IDENTITY(1, 1) not null FOREIGN KEY
	References Orders (ID),
ProductID int not null Foreign KEY
	References Product (ID),
Amount int not null
)

GO
SET IDENTITY_INSERT City ON

insert City(ID, Name)

Values (1, 'SPb')
Go
SET IDENTITY_INSERT City Off
SET IDENTITY_INSERT Locations On

insert Locations(ID, CityID, Address)

Values (1, 1, 'Senate square h.1'),
	   (2, 1, 'Ostrovsky square h.1'),
	   (3, 1, 'Alexander Nevsky sq. h.1')
Go
SET IDENTITY_INSERT Locations Off
SET IDENTITY_INSERT Customer On

insert Customer(ID, FirstName, MiddleName, LastName, Gender, LocationID)

Values (1, 'Peter', Null, 'Romanov', 'M', 1),
	   (2, 'Sophie', 'Auguste Friederike', N'Anhalt-Zerbst-Dornburg', 'F', 3),
	   (3, 'Alex', 'Rurickovich', Null, 'M', 2)
Go
SET IDENTITY_INSERT Customer Off
SET IDENTITY_INSERT Currency On
Insert Currency(ID, Name)

Values (1, 'r.')
Go
SET IDENTITY_INSERT Currency Off
SET IDENTITY_INSERT Product On

Insert Product(ID, Name, Unit, Price, CurrencyID)

Values (1, 'Axe', 'p.', 500, 1),
	   (2, 'Saw', 'p.', 450, 1),
	   (3, 'Wood boards', 'm3', 4890, 1),
	   (4, 'Balk', 'm3', 9390, 1),
	   (5, 'Canvas', 'm. p.', 182, 1),
	   (6, 'Ball Gown', 'p.', 15000, 1),
	   (7, 'Chicken breasts', 'kg.', 180, 1),
	   (8, 'Salad', 'p.', 52, 1)
Go	   
SET IDENTITY_INSERT Product Off
SET IDENTITY_INSERT Orders On

Insert Orders(ID, CustomerID, TotalCost)

Values (1, 1, 1184950),
	   (2, 3, 14985000),
	   (3, 2, 1160)
Go
SET IDENTITY_INSERT Orders Off
SET IDENTITY_INSERT OrderDetail On

Insert OrderDetail(ID, ProductID, Amount)

Values (1, 1, 1),
	   (1, 2, 1),
	   (1, 3, 200),
	   (1, 4, 20),
	   (1, 5, 100),
	   (2, 6, 999),
	   (3, 7, 5),
	   (3, 8, 5)

Go
SET IDENTITY_INSERT OrderDetail Off
go

Select * from Customer

Select * from Locations

Select * from City

Select * from Currency

Select * from Product

Select * from Orders

Select * from OrderDetail
