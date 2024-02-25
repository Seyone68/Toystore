Create Table Customer_Source
(
Cust_ID nvarchar(20),
Name varchar(50),
Address varchar(50),
State varchar(50),
City varchar(50),
Country varchar(50),
PRIMARY KEY(Cust_ID)
);
Insert into Customer_Source values('C002', 'Kumar Ratnavel', '15E, JP Lewus road', 'North Province', 'Jaffna', 'Sri Lanka');
Insert into Customer_Source values('C014', 'Indika Herath', '455, Blue-ocean Street', 'Southern Province', 'Galle', 'Sri Lanka');
Insert into Customer_Source values('C016', 'Nimalini Umesh', '9A/1, Eether Road', 'Eastern Province', 'Ampara', 'Sri Lanka');
Insert into Customer_Source values('C005', 'Rozanne Silva', '256, Devon Hills Road', 'Central Province', 'Matale', 'Sri Lanka');

Select * from Customer_Source

Truncate Table Customer_Source


IF EXISTS ( SELECT  * FROM    dbo.sysobjects WHERE   id = OBJECT_ID(N'DimCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1 )
DROP TABLE DimCustomer
CREATE TABLE DimCustomer
(
ID int identity,
Cus_No nvarchar(50),
Cus_Name varchar(50),
Cus_Address varchar(50),
Cus_State varchar(50),
Cus_City varchar(50),
Cus_Country varchar(50),
LoadDate datetime,
UpdateDate datetime
)
go

Select * from DimCustomer

Truncate Table DimCustomer

Update [ToyStore_Target].dbo.Customer_Source 
Set Name = 'Devni Lakmal'
Where Cust_ID = 'C002'

Update [ToyStore_Target].dbo.Customer_Source 
Set Address = '112, Kendala Mawatha',
City = 'Hambantota'
Where Cust_ID = 'C014'

Update [ToyStore_Target].dbo.Customer_Source 
Set Address = '89, W A De silva Road',
City = 'Colombo 06'
Where Cust_ID = 'C002'