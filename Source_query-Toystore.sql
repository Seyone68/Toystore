Create Database ToyStore;

use ToyStore;

Create Table Product
(
Product_ID nvarchar(50),
Prod_Descrpt varchar(50),
Product_Type varchar(50),
Product_Cat varchar(50),
Qty int,
Measurement varchar(50),
Unit_Price decimal(10,2),
PRIMARY KEY(Product_ID)
);

Insert into Product values('P001', 'Teddy Bear', 'Soft Toy', 'Age 3+', 56, 'Size - M', 355.00);
Insert into Product values('P002', 'Batman AK figure', 'Plastic model', 'Age 10+', 20, 'Size - M', 480.00);
Insert into Product values('P003', 'UNO', 'Arcade', 'Age 10+', 07, 'Unit', 300.00);
Insert into Product values('P004', 'Lego Techniq - P911', 'Plastic Model', 'Age 16+', 05, 'Unit', 2800.00);
Insert into Product values('P005', 'Carrom', 'Arcade', 'Age 10+', 20, 'Size - L', 1250.00);
Insert into Product values('P006', 'Barbie Princess', 'Soft Toy', 'Age 3+', 10, 'Size - S', 567.00);
Insert into Product values('P007', 'Badminton Kit', 'Sports', 'Age 10+', 32, 'Unit', 1755.00);
Insert into Product values('P008', 'Dart', 'Arcade', 'Age 16+', 10, 'Unit', 2250.00);
Insert into Product values('P009', 'Ralley RC', 'RC Toy', 'Age 10+', 56, 'Unit', 1500.00);
Insert into Product values('P010', '1000PC Spot Puzzle', 'Arcade', 'Age 16+', 3, 'Unit', 979.00);

Select * from Product;

Alter Table Product Alter Column Unit_Price decimal(10,2)

Create Table Customer
(
Cust_ID nvarchar(20),
Name varchar(50),
Address varchar(50),
State varchar(50),
City varchar(50),
Country varchar(50),
PRIMARY KEY(Cust_ID)
);

Insert into Customer values('C001', 'Nimal Perera', 'No 2B, Dutugemunu Street', 'Western Province', 'Colombo 10', 'Sri Lanka');
Insert into Customer values('C002', 'Devni Lakmal', 'No 2/1, Torrington Avenue', 'Western Province', 'Colombo 05', 'Sri Lanka');
Insert into Customer values('C003', 'Peter Aloysis', '12, Park Road', 'Western Province', 'Colombo 05', 'Sri Lanka');
Insert into Customer values('C004', 'Visvam Prasad', 'No 269, Melbourne Avenue', 'Western Province', 'Colombo 04', 'Sri Lanka');
Insert into Customer values('C005', 'Rozanne Silva', '89/2C, Dalada Road', 'Central Province', 'Kandy', 'Sri Lanka');
Insert into Customer values('C006', 'Rajan Krishnamoorthy', 'No 598, KKS Road', 'Northern Province', 'Jaffna', 'Sri Lanka');
Insert into Customer values('C007', 'Jerald Fonseka', '08, Mahavidya Road', 'Central Province', 'Matale', 'Sri Lanka');
Insert into Customer values('C008', 'Abdul Hameed', 'Imam Logistics, C.H.Farook mawatha', 'Eastern Province', 'Ampara', 'Sri Lanka');
Insert into Customer values('C009', 'Gayan Sripala', 'No 52A, Fortlight Street', 'Southern Province', 'Galle', 'Sri Lanka');
Insert into Customer values('C010', 'Ravindu Jayakody', 'BX 12/9, Elvitigala mawatha', 'Western Province', 'Colombo 08', 'Sri Lanka');
Insert into Customer values('C011', 'Guru Prasanna', '22, Boswell Place', 'Western Province', 'Colombo 06', 'Sri Lanka');
Insert into Customer values('C012', 'Vithun Ragav', '67, Bagatale Road', 'Western Province', 'Colombo 04', 'Sri Lanka');
Insert into Customer values('C013', 'John Michael', '129, Nirveli Street', 'Northern Province', 'Jaffna', 'Sri Lanka');
Insert into Customer values('C014', 'Kumar Jayaratne', '455, Blue-ocean Street', 'Southern Province', 'Galle', 'Sri Lanka');
Insert into Customer values('C015', 'Mohammed Rafik', '7B/1, Kandy Road', 'Eastern Province', 'Batticaloa', 'Sri Lanka');

Select * from Customer;


Create Table Store
(
Store_ID int,
Name varchar(50),
Address varchar(50),
City varchar(50),
Country varchar(50),
PRIMARY KEY(Store_ID)
);

Insert into Store values(1, 'G.L Gift Shop', '242, Galle Road', 'Bamba', 'Sri Lanka');
Insert into Store values(2, 'KIDS Store', '456, Galle Road', 'Colpetty', 'Sri Lanka');
Insert into Store values(3, 'Walk n Shop', '9, Cotta Road', 'Nugegoda', 'Sri Lanka');
Insert into Store values(4, 'Vathsala Goods', '55/2A, Main Street', 'Kotahena', 'Sri Lanka');
Insert into Store values(5, 'UpGo Superstore', '98, Galle Road', 'Wellawatte', 'Sri Lanka');
Insert into Store values(6, 'OnSpot Shop', '1652, Negombo Road', 'Wattala', 'Sri Lanka');
Insert into Store values(7, 'Fair Market', '881, Kotte Road', 'Hendala', 'Sri Lanka');

Select * from Store;

Create Table Orders
(
Order_ID nvarchar(20),
Order_Date Date,
Delivery_Date Date,
Qty int,
Promo_ID nvarchar(20),
Cust_ID nvarchar(20),
Prod_ID nvarchar(50),
Store_ID int,
PRIMARY KEY(Order_ID),
FOREIGN KEY(Cust_ID) References Customer(Cust_ID),
FOREIGN KEY(Prod_ID) References Product(Product_ID),
FOREIGN KEY(Store_ID) References Store(Store_ID),
FOREIGN KEY(Promo_ID) References Promotions(Code)
);

Insert into Orders values('OD001', '01/15/2021', '01/18/2021', 1, 'C003', 'P005', 5, 'D01');
Insert into Orders values('OD002', '01/20/2021', '01/21/2021', 1, 'C006', 'P004', 6, 'D01');
Insert into Orders values('OD003', '02/08/2021', '02/11/2021', 2, 'C001', 'P010', 4, 'D01');
Insert into Orders values('OD004', '03/26/2021', '03/30/2021', 2, 'C004', 'P003', 1, 'D01');
Insert into Orders values('OD005', '04/18/2021', '04/19/2021', 10, 'C002', 'P001', 7, 'D02');
Insert into Orders values('OD006', '04/22/2021', '04/25/2021', 4, 'C008', 'P009', 3, 'D02');
Insert into Orders values('OD007', '06/01/2021', '06/04/2021', 5, 'C009', 'P007', 2, 'D02');
Insert into Orders values('OD008', '07/06/2021', '07/08/2021', 2, 'C013', 'P006',6, 'D03');
Insert into Orders values('OD009', '07/15/2021', '07/18/2021', 1, 'C010', 'P002', 3, 'D03');
Insert into Orders values('OD010', '08/27/2021', '08/31/2021', 1, 'C015', 'P008',7, 'D03');
Insert into Orders values('OD011', '09/19/2021', '09/22/2021', 2, 'C005', 'P007', 6, 'D03');
Insert into Orders values('OD012', '11/09/2021', '11/11/2021', 3, 'C012', 'P002', 1, 'D04');
Insert into Orders values('OD013', '11/13/2021', '11/14/2021', 1, 'C007', 'P010', 2, 'D04');
Insert into Orders values('OD014', '12/04/2021', '12/06/2021', 3, 'C014', 'P001', 7, 'D04');
Insert into Orders values('OD015', '12/03/2021', '12/06/2021', 8, 'C011', 'P009', 2, 'D04');

Select * from Orders;

--Update Orders
--SET Promo_ID = 'D04'
--Where Order_ID = 'OD012';


Create Table Promotions
(
Code nvarchar(20),
Discount_Percentage float,
Start_Date Date,
End_Date Date,
PRIMARY KEY(Code)
);

Insert into Promotions values('D01', 0.15, '01/01/2021', '03/30/2021');
Insert into Promotions values('D02', 0.10, '04/01/2021', '06/30/2021');
Insert into Promotions values('D03', 0.05, '07/01/2021', '10/31/2021');
Insert into Promotions values('D04', 0.25, '11/01/2021', '12/31/2021');

Select * from Promotions;