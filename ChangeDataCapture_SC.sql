Use ToyStore_Target;

Exec sys.sp_cdc_enable_db;

--Exec sys.sp_cdc_disable_db;

Select name, is_cdc_enabled From sys.databases where is_cdc_enabled = 1;

Exec sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name = N'Product_Dim',
@role_name = Null,
@filegroup_name =Null,
@supports_net_changes = 0
Go

Select name, is_tracked_by_cdc from sys.tables where is_tracked_by_cdc = 1;

-- To check CDC is enabled in the table
Exec sys.sp_cdc_help_change_data_capture
@source_schema = 'dbo',
@source_name = 'Product_Dim'

Select * from Product_Dim

--Insert values
Insert into Product_Dim values('P011', 'Scrabbles', 'Arcade', 'Age 10+', 10, 1350.00);
Insert into Product_Dim values('P012', 'Hot Wheels TRC Edtn', 'Plastic Model', 'Age 10+', 7, 1790.00);
Insert into Product_Dim values('P013', 'LRover Mechanic Build', 'Plastic Model', 'Age 16+', 12, 1100.00);

--Update values
Update Product_Dim
Set Available_Qty = 25
Where Prod_ID = 'P012'

Update Product_Dim
Set Unit_Price = 1800
Where Prod_ID = 'P009'

Select * from [ToyStore_Target].[cdc].[dbo_Product_Dim_CT]


--Disabling CDC
Exec sys.sp_cdc_disable_table
@source_schema = N'dbo',
@source_name = N'Product_Dim'
@capture_instance = N'dbo_Product_Dim_CT'
Go