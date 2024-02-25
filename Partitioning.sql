REM   Script: SECTION F Partition
REM   Assignment

Create Table Sales_data_range  
(  
Product_Name varchar(50),  
Sales_Amount number,  
Sales_Year number,  
Country varchar(50)  
) 
Partition by Range(Sales_Year) 
( 
Partition Y1 Values less than(2020), 
Partition Y2 Values less than(2021), 
Partition Y3 Values less than(2022) 
);

Insert into Sales_data_range values('Product A', 25000, 2019, 'Sri Lanka');

Insert into Sales_data_range values('Product B', 20000, 2020, 'India');

Insert into Sales_data_range values('Product C', 32000, 2020, 'Sri Lanka');

Insert into Sales_data_range values('Product D', 45000, 2019, 'UK');

Insert into Sales_data_range values('Product E', 50000, 2021, 'USA');

Insert into Sales_data_range values('Product F', 35000, 2021, 'India');

Insert into Sales_data_range values('Product G', 67000, 2021, 'Sri Lanka');

Insert into Sales_data_range values('Product H', 58000, 2019, 'UK');

Insert into Sales_data_range values('Product I', 46000, 2020, 'Australia');

Insert into Sales_data_range values('Product J', 28000, 2019, 'Australia');

Select * from Sales_data_range;

Select * from Sales_data_range Partition(Y1);

Select * from Sales_data_range Partition(Y2);

Select * from Sales_data_range Partition(Y3);

Create Table Sales_data_list 
(  
Product_Name varchar(50),  
Sales_Amount number,  
Sales_Year number,  
Country varchar(50)  
) 
Partition by LIST(Country) 
( 
Partition West Values('UK', 'USA'), 
Partition Central Values('Sri Lanka', 'India'), 
Partition East Values('Australia') 
);

Insert into Sales_data_list values('Product A', 25000, 2019, 'Sri Lanka');

Insert into Sales_data_list values('Product B', 20000, 2020, 'India');

Insert into Sales_data_list values('Product C', 32000, 2020, 'Sri Lanka');

Insert into Sales_data_list values('Product D', 45000, 2019, 'UK');

Insert into Sales_data_list values('Product E', 50000, 2021, 'USA');

Insert into Sales_data_list values('Product F', 35000, 2021, 'India');

Insert into Sales_data_list values('Product G', 67000, 2021, 'Sri Lanka');

Insert into Sales_data_list values('Product H', 58000, 2019, 'UK');

Insert into Sales_data_list values('Product I', 46000, 2020, 'Australia');

Insert into Sales_data_list values('Product J', 28000, 2019, 'Australia');

Select * from Sales_data_list Partition(West);

Select * from Sales_data_list Partition(Central);

Select * from Sales_data_list Partition(East);

Create Table Sales_data 
(  
Product_Name varchar(50),  
Sales_Amount number,  
Sales_Year number,  
Country varchar(50)  
);

Insert into Sales_data values('Product A', 25000, 2019, 'Sri Lanka');

Insert into Sales_data values('Product B', 20000, 2020, 'India');

Insert into Sales_data values('Product C', 32000, 2020, 'Sri Lanka');

Insert into Sales_data values('Product D', 45000, 2019, 'UK');

Insert into Sales_data values('Product E', 50000, 2021, 'USA');

Insert into Sales_data values('Product F', 35000, 2021, 'India');

Insert into Sales_data values('Product G', 67000, 2021, 'Sri Lanka');

Insert into Sales_data values('Product H', 58000, 2019, 'UK');

Insert into Sales_data values('Product I', 46000, 2020, 'Australia');

Insert into Sales_data values('Product J', 28000, 2019, 'Australia');

Select * from Sales_data;

Alter Table Sales_data Modify 
Partition By Range(Sales_Year) 
( 
Partition Y1 Values less than(2020), 
Partition Y2 Values less than(2021), 
Partition Y3 Values less than(2022) 
);

