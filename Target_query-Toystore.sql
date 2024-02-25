Create Database ToyStore_Target;

Use ToyStore_Target;

Create Table Product_Dim
(
Prod_ID nvarchar(50),
Prod_Name varchar(50),
Prod_Type varchar(50),
Prod_Cat varchar(50),
Available_Qty int,
Unit_Price decimal(10,2),
Primary Key(Prod_ID)
);

Truncate Table Product_Dim

Delete from Product_Dim
DBCC CHECKIDENT ('Product_Dim', RESEED, 0)

Select * from Product_Dim


Create Table Customer_Dim
(
Cus_No nvarchar(50),
Cus_Name varchar(50),
Cus_Address varchar(50),
Cus_State varchar(50),
Cus_City varchar(50),
Cus_Country varchar(50),
Primary key(Cus_No)
);

Truncate Table Customer_Dim

Select * from Customer_Dim

Delete from Customer_Dim
DBCC CHECKIDENT ('Customer_Dim', RESEED, 0)

Create Table GeoLocation
(
Cus_No nvarchar(50),
Cus_State varchar(50),
Cus_City varchar(50),
Cus_Country varchar(50),
Store_No int,
Store_City varchar(50)
);

Truncate Table GeoLocation

Select * from GeoLocation


Create Table Orders_Dim
(
Ord_ID nvarchar(20),
Ord_Date Date,
Delv_Date Date,
Qty int,
Cust_ID nvarchar(50),
Promo_ID nvarchar(20),
Prod_ID nvarchar(50),
Primary Key(Ord_ID),
Foreign Key(Cust_ID) References Customer_Dim(Cus_No),
Foreign Key(Prod_ID) References Product_Dim(Prod_ID)
);

Truncate Table Orders_Dim

Select * from Orders_Dim

Alter Table Orders_Dim Drop Constraint FK_Orders_Dim_Customer_Dim
Alter Table Orders_Dim Drop Constraint FK_Orders_Dim_Product_Dim

Alter Table Orders_Dim Add Constraint FK_Orders_Dim_Customer_Dim Foreign Key(Cust_ID)
Alter Table Orders_Dim Add Constraint FK_Orders_Dim_Product_Dim Foreign Key(Prod_ID)

Delete from Orders_Dim
DBCC CHECKIDENT ('Orders_Dim', RESEED, 0)

Create Table Promotions_Dim
(
Promo_Code nvarchar(20),
Discount float,
Promo_Strt_Date Date,
Promo_End_Date Date,
Primary Key(Promo_Code)
);

Truncate Table Promotions_Dim

Select * from Promotions_Dim


Create Table Date_Dim
(
Date_Key nvarchar(50),
Ord_Date Date,
Delv_Date Date,
Ord_Month int
);

Truncate Table Date_Dim

Select * from Date_Dim


Create Table Sales_Fact
(
Cus_No nvarchar(50),
Cus_Name varchar(50),
Date_Key nchar,
Ord_ID nvarchar(20),
Ord_Date Date,
Prod_ID nvarchar(50),
Prod_Name varchar(50),
Qty int,
Promo_Code nvarchar(20),
Discount float,
Unit_Price decimal(10,2),
Total_Price decimal(10,2),
Store_No int,
Store_City varchar(50)
);


Truncate Table Sales_Fact

Select * from Sales_Fact


Truncate Table Product_Sales
Select * from Product_Sales

Truncate Table Location_Sales
Select * from Location_Sales

Truncate Table Monthly_Sales
Select * from Monthly_Sales
