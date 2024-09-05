use master;
go
drop database Scales_Cloud;
go
use master;
go
Create database Scales_Cloud;
go
use Scales_Cloud;
go
----
ALTER DATABASE [Scales_Cloud] COLLATE Arabic_100_CI_AI;
----
go
----
CREATE LOGIN Scales_Cloud_Admin WITH PASSWORD = 'AbC!@#$%^&*()_+1234567890';
---
go
---
exec sp_changedbowner 'Scales_Cloud_Admin';
---
go
-------
Create Table Store
(
Store_ID int primary key identity(1,1),
Store_Name varchar(50),
Store_Address varchar(50)
)
-----
Create Table Licence
(
Licence_ID int primary key identity(1,1),
Licence_Key varchar(100)
)
-----
Create Table Department
(
Dept_ID int primary key identity(1,1),
Dept_Code int,
Dept_Name varchar(50),
Store_ID_FK int
)
-----
Create Table Main_Group
(
Main_Group_ID int primary key identity(1,1),
Main_Group_Code int,
Main_Group_Name varchar(50),
Main_Group_description varchar(50),
Dept_ID_FK int
)
-----
Create Table Scale_Brand
(
Scale_Brand_ID int primary key,
Scale_Brand_Name varchar(50)
)
-----
Create Table Scale_Model
(
Scale_Model_ID int primary key,
Scale_Model_Name varchar(50)
)
-----
Create Table Scales
(
Scale_ID int primary key identity(1,1),
Scale_Name varchar(50),
Scale_IP varchar(50),
Linked1 varchar(50),
Linked2 varchar(50),
Linked3 varchar(50),
Linked4 varchar(50),
Linked5 varchar(50),
Linked6 varchar(50),
Linked7 varchar(50),
Linked8 varchar(50),
Linked9 varchar(50),
Scale_Brand_ID_FK int,
Scale_Model_ID_FK int,
Main_Group_ID_FK int,
Scale_Use int,
Image_index int,
Preset_Key_FK int
)
-----
Create Table Label_Format
(
Label_Format_ID int primary key,
Label_Format_Name varchar(50)
)
-----
Create Table Font
(
Font_ID int primary key,
Font_Name varchar(50)
)
-----
Create Table PLU_Type
(
PLU_Type_ID int primary key,
PLU_Type_Name varchar(50)
)
-----
Create Table Barcode_Format
(
Barcode_Format_ID int primary key,
Barcode_Format_Name varchar(50)
)
-----
Create Table Update_Process
(
Update_Process_ID int primary key,
Update_Type_Name varchar(50),
User_ID_FK int,
Update_Date datetime
)
-----
Create Table Users
(
User_ID int primary key identity(1,1),
User_Name varchar(50),
Password varchar(50),
Authority varchar(50),
Notes varchar(50)
)
-----
Create Table Log
(
User_ID_FK int,
Application_Name varchar(50),
Action varchar(50),
Date datetime,
Result varchar(50),
Details varchar(100)
)
-----
Create Table Settings
(
Settings_ID int primary key,
Type varchar(50),
Barcode_Format int,
Use_By_Date int,
Use_By_Date_Print int,
Label_Format int,
Font int,
Font_Ingrdeint int,
Flag varchar(50),
Sell_By_Date int,
Sell_By_Date_Print int,
Pack_Time int,
Pack_Time_Print int,
Sell_By_Time int,
Sell_By_Time_Print int,
Font_DP int,
Font_DP_Ingrd int,
MultiSection varchar(50),
Import_Setting_ID_FK int
)
-----
Create Table PLU
(
PLU_ID int primary key identity(1,1),
PLU_Code int,
Unit_Price decimal(18,2),
Main_Group_ID_FK int,
PLU_Type varchar(50),
PLU_Quantity varchar(50),
PLU_Symbol varchar(50),
PLU_Commodity varchar(50),
SP_Message varchar(50),
Char_Size varchar(50),
Font_ID_FK int,
Ingrd1 varchar(300),
Ingrd2 varchar(300),
Ingrd3 varchar(300),
Ingrd4 varchar(300),
Ingrd5 varchar(300),
Ingrd6 varchar(300),
Ingrd7 varchar(300),
Ingrd8 varchar(300),
Ingrd9 varchar(300),
Ingrd10 varchar(300),
Ingrd11 varchar(300),
Ingrd12 varchar(300),
Ingrd13 varchar(300),
Ingrd14 varchar(300),
Ingrd15 varchar(300),
Ingrd16 varchar(300),
Ingrd17 varchar(300),
Ingrd18 varchar(300),
Ingrd19 varchar(300),
Barcode_Format_ID_FK int,
Flag varchar(50),
Item_Code varchar(50),
RS_Data varchar(50),
Label_Format_ID_FK int,
Packed_By_Date int,
Packed_By_Date_Print int,
Packed_By_Time int,
Packed_By_Time_Print int,
Sell_By_Date int,
Sell_By_Date_Print int,
Sell_By_Time int,
Sell_By_Time_Print int,
Use_By_Date int,
Use_By_Date_Print int,
Image1 int,
Image2 int,
Image3 int,
Image4 int,
User_ID_FK int,
Settings_ID_FK int,
CharEncoding varchar(100),
EAN_Data varchar(50),
TWS_BIN_SM100 varchar(8000),
TWS_BIN_SM300 varchar(8000),
TWS_BIN_SM5500 varchar(8000),
TWS_BIN_SM500 varchar(8000),
TWS_BIN_DPS varchar(8000),
TWS_BIN_SM5500_Merged varchar(8000)
)
----
Create Table Import_Setting
(
Import_Setting_ID int primary key,
Import_Path varchar(300),
File_Type varchar(50),
Customer_Name varchar(50),
Delete_DB int
)
-----
go
----
Alter table Department
Add constraint FK_Store_Department foreign key (Store_ID_FK) references Store(Store_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table Main_Group
Add constraint FK_MainGroup_Department foreign key (Dept_ID_FK) references Department(Dept_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table Scales
Add constraint FK_MainGroup_Scales foreign key (Main_Group_ID_FK) references Main_Group(Main_Group_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table Scales
Add constraint FK_Brand_Scales foreign key (Scale_Brand_ID_FK) references Scale_Brand(Scale_Brand_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table Scales
Add constraint FK_Model_Scales foreign key (Scale_Model_ID_FK) references Scale_Model(Scale_Model_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table Update_Process
Add constraint FK_Update_Process_Users foreign key (User_ID_FK) references Users(User_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table Log
Add constraint FK_Log_Users foreign key (User_ID_FK) references Users(User_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table PLU
Add constraint FK_PLU_Settings foreign key (Settings_ID_FK) references Settings(Settings_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table PLU
Add constraint FK_PLU_Users foreign key (User_ID_FK) references Users(User_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table PLU
Add constraint FK_PLU_LabelFormat foreign key (Label_Format_ID_FK) references Label_Format(Label_Format_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table PLU
Add constraint FK_PLU_Font foreign key (Font_ID_FK) references Font(Font_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table PLU
Add constraint FK_PLU_BarcodeFormat foreign key (Barcode_Format_ID_FK) references Barcode_Format(Barcode_Format_ID)
on delete cascade
on update cascade; 
----
go
----
Alter table PLU
Add constraint FK_PLU_MainGroup foreign key (Main_Group_ID_FK) references Main_Group(Main_Group_ID)
on delete cascade
on update cascade; 
----
go
----
Create Proc CheckUsersExisit
@UserName varchar(50),
@Password varchar(50)
as
begin
if (exists(select * from Users where User_Name=@UserName and Password=@Password ))
begin
return 1
end
else
begin
return 0
end
end
----
go
----
insert into Users (User_Name,Password,Authority) values ('Admin','Admin','Administrator');

insert into Store(Store_Name) values ('Carrefour');

insert into Department(Dept_Code,Dept_Name,Store_ID_FK) values (97,'Main Department',1);

----
go
----
Create Proc AddStore
@Store_Name varchar(50),
@Store_Address varchar(50)
as
begin
insert into Store (Store_Name,Store_Address)
values (@Store_Name,@Store_Address)
end
----
go
----
Create Proc AddUser
@User_Name varchar(50),
@Password varchar(50),
@Authority varchar(50),
@Notes varchar(50)
as
begin
insert into Users (User_Name,Password,Authority,Notes)
values (@User_Name,@Password,@Authority,@Notes)
end
----
go
----
Create Proc EditUser
@User_ID int,
@User_Name varchar(50),
@Password varchar(50),
@Authority varchar(50),
@Notes varchar(50)
as
begin
Update Users
Set User_Name=@User_Name,Password=@Password,Authority=@Authority,Notes=@Notes where User_ID = @User_ID
end
----
go
----
Create Proc EditStore
@Store_ID int,
@Store_Name varchar(50),
@Store_Address varchar(50)
 as
 begin
 update Store
 Set Store_Name=@Store_Name, Store_Address=@Store_Address where Store_ID=@Store_ID
 end
 ----
 go
 ----
 Create Proc AddDept
@Dept_Code int,
@Dept_Name varchar(50),
@Store_ID_FK int
 as
 begin
 insert into Department (Dept_Code,Dept_Name,Store_ID_FK)
 values (@Dept_Code,@Dept_Name,@Store_ID_FK)
 end
 ----
 go
 ----
 Create Proc EditDept
@Dept_ID int,
@Dept_Code int,
@Dept_Name varchar(50),
@Store_ID_FK int
 as
 begin
 update Department
 Set Dept_Code=@Dept_Code, Dept_Name=@Dept_Name,Store_ID_FK=@Store_ID_FK where Dept_ID=@Dept_ID
 end
 ----
 go
 ----
  Create Proc AddMainGroup
@Main_Group_Code int,
@Main_Group_Name varchar(50),
@Main_Group_description varchar(50),
@Dept_ID_FK int
 as
 begin
 insert into Main_Group(Main_Group_Code,Main_Group_Name,Main_Group_description,Dept_ID_FK)
 values (@Main_Group_Code,@Main_Group_Name,@Main_Group_description,@Dept_ID_FK)
 end
 ----
 go
 ----
  ----
  Create Proc EditMainGroup
@Main_Group_ID int,
@Main_Group_Code int,
@Main_Group_Name varchar(50),
@Main_Group_description varchar(50),
@Dept_ID_FK int
 as
 begin
 update Main_Group
 Set Main_Group_Code=@Main_Group_Code, Main_Group_Name=@Main_Group_Name, Main_Group_description=@Main_Group_description,Dept_ID_FK=@Dept_ID_FK where Main_Group_ID=@Main_Group_ID
 end
 ----
 go
 ----
Create Proc AddScale
@Scale_Name varchar(50),
@Scale_IP varchar(50),
@Linked1 varchar(50),
@Linked2 varchar(50),
@Linked3 varchar(50),
@Linked4 varchar(50),
@Linked5 varchar(50),
@Linked6 varchar(50),
@Linked7 varchar(50),
@Linked8 varchar(50),
@Linked9 varchar(50),
@Scale_Brand_ID_FK int,
@Scale_Model_ID_FK int,
@Main_Group_ID_FK int,
@Scale_Use int,
@Image_index int,
@Preset_Key_FK int
 as
 begin
 insert into Scales(Scale_Name,Scale_IP,Linked1,Linked2,Linked3,Linked4,Linked5,Linked6,Linked7,Linked8,Linked9,Scale_Brand_ID_FK,Scale_Model_ID_FK,Main_Group_ID_FK,Scale_Use,Image_index,Preset_Key_FK)
 values(@Scale_Name,@Scale_IP,@Linked1,@Linked2,@Linked3,@Linked4,@Linked5,@Linked6,@Linked7,@Linked8,@Linked9,@Scale_Brand_ID_FK,@Scale_Model_ID_FK,@Main_Group_ID_FK,@Scale_Use,@Image_index, @Preset_Key_FK)
 end
 ----
 go
 ----
Create Proc AddLog
@User_ID_FK int,
@Application_Name varchar(50),
@Action varchar(50),
@Date datetime,
@Result varchar(50),
@Details varchar(100)
 as
 begin
 insert into Log(User_ID_FK,Application_Name,Action,Date,Result,Details)
 values(@User_ID_FK,@Application_Name,@Action,@Date,@Result,@Details)
 end
 ----
 go
 ----
Create Proc EditScale
@Scale_ID int,
@Scale_Name varchar(50),
@Scale_IP varchar(50),
@Linked1 varchar(50),
@Linked2 varchar(50),
@Linked3 varchar(50),
@Linked4 varchar(50),
@Linked5 varchar(50),
@Linked6 varchar(50),
@Linked7 varchar(50),
@Linked8 varchar(50),
@Linked9 varchar(50),
@Scale_Brand_ID_FK int,
@Scale_Model_ID_FK int,
@Main_Group_ID_FK int,
@Scale_Use int,
@Image_index int,
@Preset_Key_FK int
 as
 begin
 update Scales
 Set Scale_Name=@Scale_Name, Scale_IP=@Scale_IP, Linked1=@Linked1,Linked2=@Linked2,Linked3=@Linked3,Linked4=@Linked4,Linked5=@Linked5,Linked6=@Linked6,Linked7=@Linked7,Linked8=@Linked8,Linked9=@Linked9,Scale_Brand_ID_FK=@Scale_Brand_ID_FK,Scale_Model_ID_FK=@Scale_Model_ID_FK,Main_Group_ID_FK=@Main_Group_ID_FK,Scale_Use=@Scale_Use,Image_index=@Image_index, Preset_Key_FK=@Preset_Key_FK where Scale_ID=@Scale_ID
 end
 ----
 go
 ----
Create Proc AddPLU
@PLU_Code int,
@Unit_Price decimal(10,2),
@Main_Group_ID_FK int,
@PLU_Type varchar(50),
@PLU_Quantity varchar(50),
@PLU_Symbol varchar(50),
@PLU_Commodity varchar(50),
@SP_Message varchar(50),
@Char_Size varchar(50),
@Font_ID_FK int,
@Ingrd1 varchar(300),
@Ingrd2 varchar(300),
@Ingrd3 varchar(300),
@Ingrd4 varchar(300),
@Ingrd5 varchar(300),
@Ingrd6 varchar(300),
@Ingrd7 varchar(300),
@Ingrd8 varchar(300),
@Ingrd9 varchar(300),
@Ingrd10 varchar(300),
@Ingrd11 varchar(300),
@Ingrd12 varchar(300),
@Ingrd13 varchar(300),
@Ingrd14 varchar(300),
@Ingrd15 varchar(300),
@Ingrd16 varchar(300),
@Ingrd17 varchar(300),
@Ingrd18 varchar(300),
@Ingrd19 varchar(300),
@Barcode_Format_ID_FK int,
@Flag varchar(50),
@Item_Code varchar(50),
@RS_Data varchar(50),
@Label_Format_ID_FK int,
@Packed_By_Date int,
@Packed_By_Date_Print int,
@Packed_By_Time int,
@Packed_By_Time_Print int,
@Sell_By_Date int,
@Sell_By_Date_Print int,
@Sell_By_Time int,
@Sell_By_Time_Print int,
@Use_By_Date int,
@Use_By_Date_Print int,
@Image1 int,
@Image2 int,
@Image3 int,
@Image4 int,
@User_ID_FK int,
@Settings_ID_FK int,
@CharEncoding varchar(100),
@EAN_Data varchar(50),
@TWS_BIN_SM100 varchar(8000),
@TWS_BIN_SM300 varchar(8000),
@TWS_BIN_SM5500 varchar(8000),
@TWS_BIN_SM500 varchar(8000),
@TWS_BIN_DPS varchar(8000),
@TWS_BIN_SM5500_Merged varchar(8000)

 as
 begin
 insert into PLU(PLU_Code,Unit_Price,Main_Group_ID_FK,PLU_Type,PLU_Quantity,PLU_Symbol,PLU_Commodity,SP_Message,Char_Size,Font_ID_FK,Ingrd1,Ingrd2,Ingrd3,Ingrd4,Ingrd5,Ingrd6,Ingrd7,Ingrd8,Ingrd9,Ingrd10,Ingrd11,Ingrd12,Ingrd13,Ingrd14,Ingrd15,Ingrd16,Ingrd17,Ingrd18,Ingrd19,Barcode_Format_ID_FK,Flag,Item_Code,RS_Data,Label_Format_ID_FK,Packed_By_Date,Packed_By_Date_Print,Packed_By_Time,Packed_By_Time_Print,Sell_By_Date,Sell_By_Date_Print,Sell_By_Time,Sell_By_Time_Print,Use_By_Date,Use_By_Date_Print,Image1,Image2,Image3,Image4,User_ID_FK,Settings_ID_FK,CharEncoding,EAN_Data, TWS_BIN_SM100, TWS_BIN_SM300,TWS_BIN_SM5500,TWS_BIN_SM500, TWS_BIN_DPS, TWS_BIN_SM5500_Merged)
 values(@PLU_Code,@Unit_Price,@Main_Group_ID_FK,@PLU_Type,@PLU_Quantity,@PLU_Symbol,@PLU_Commodity,@SP_Message,@Char_Size,@Font_ID_FK,@Ingrd1,@Ingrd2,@Ingrd3,@Ingrd4,@Ingrd5,@Ingrd6,@Ingrd7,@Ingrd8,@Ingrd9,@Ingrd10,@Ingrd11,@Ingrd12,@Ingrd13,@Ingrd14,@Ingrd15,@Ingrd16,@Ingrd17,@Ingrd18,@Ingrd19,@Barcode_Format_ID_FK,@Flag,@Item_Code,@RS_Data,@Label_Format_ID_FK,@Packed_By_Date,@Packed_By_Date_Print,@Packed_By_Time,@Packed_By_Time_Print,@Sell_By_Date,@Sell_By_Date_Print,@Sell_By_Time,@Sell_By_Time_Print,@Use_By_Date,@Use_By_Date_Print,@Image1,@Image2,@Image3,@Image4,@User_ID_FK,@Settings_ID_FK,@CharEncoding,@EAN_Data, @TWS_BIN_SM100, @TWS_BIN_SM300, @TWS_BIN_SM5500, @TWS_BIN_SM500, @TWS_BIN_DPS, @TWS_BIN_SM5500_Merged)
 end
 ----
 go
 ----
Create Proc EditPLU
@PLU_ID int,
@PLU_Code int,
@Unit_Price decimal(10,2),
@Main_Group_ID_FK int,
@PLU_Type varchar(50),
@PLU_Quantity varchar(50),
@PLU_Symbol varchar(50),
@PLU_Commodity varchar(50),
@SP_Message varchar(50),
@Char_Size varchar(50),
@Font_ID_FK int,
@Ingrd1 varchar(300),
@Ingrd2 varchar(300),
@Ingrd3 varchar(300),
@Ingrd4 varchar(300),
@Ingrd5 varchar(300),
@Ingrd6 varchar(300),
@Ingrd7 varchar(300),
@Ingrd8 varchar(300),
@Ingrd9 varchar(300),
@Ingrd10 varchar(300),
@Ingrd11 varchar(300),
@Ingrd12 varchar(300),
@Ingrd13 varchar(300),
@Ingrd14 varchar(300),
@Ingrd15 varchar(300),
@Ingrd16 varchar(300),
@Ingrd17 varchar(300),
@Ingrd18 varchar(300),
@Ingrd19 varchar(300),
@Barcode_Format_ID_FK int,
@Flag varchar(50),
@Item_Code varchar(50),
@RS_Data varchar(50),
@Label_Format_ID_FK int,
@Packed_By_Date int,
@Packed_By_Date_Print int,
@Packed_By_Time int,
@Packed_By_Time_Print int,
@Sell_By_Date int,
@Sell_By_Date_Print int,
@Sell_By_Time int,
@Sell_By_Time_Print int,
@Use_By_Date int,
@Use_By_Date_Print int,
@Image1 int,
@Image2 int,
@Image3 int,
@Image4 int,
@User_ID_FK int,
@Settings_ID_FK int,
@CharEncoding varchar(100),
@EAN_Data varchar(50),
@TWS_BIN_SM100 varchar(8000),
@TWS_BIN_SM300 varchar(8000),
@TWS_BIN_SM5500 varchar(8000),
@TWS_BIN_SM500 varchar(8000),
@TWS_BIN_DPS varchar(8000),
@TWS_BIN_SM5500_Merged varchar(8000)

 as
 begin
 Update PLU
 Set PLU_Code=@PLU_Code,Unit_Price=@Unit_Price,Main_Group_ID_FK=@Main_Group_ID_FK,PLU_Type=@PLU_Type,PLU_Quantity=@PLU_Quantity,PLU_Symbol=@PLU_Symbol,PLU_Commodity=@PLU_Commodity,SP_Message=@SP_Message,Char_Size=@Char_Size,Font_ID_FK=@Font_ID_FK,Ingrd1=@Ingrd1,Ingrd2=@Ingrd2,Ingrd3=@Ingrd3,Ingrd4=@Ingrd4,Ingrd5=@Ingrd5,Ingrd6=@Ingrd6,Ingrd7=@Ingrd7,Ingrd8=@Ingrd8,Ingrd9=@Ingrd9,Ingrd10=@Ingrd10,Ingrd11=@Ingrd11,Ingrd12=@Ingrd12,Ingrd13=@Ingrd13,Ingrd14=@Ingrd14,Ingrd15=@Ingrd15,Ingrd16=@Ingrd16,Ingrd17=@Ingrd17,Ingrd18=@Ingrd18,Ingrd19=@Ingrd19,Barcode_Format_ID_FK=@Barcode_Format_ID_FK,Flag=@Flag,Item_Code=@Item_Code,RS_Data=@RS_Data,Label_Format_ID_FK=@Label_Format_ID_FK,Packed_By_Date=@Packed_By_Date,Packed_By_Date_Print=@Packed_By_Date_Print,Packed_By_Time=@Packed_By_Time,Packed_By_Time_Print=@Packed_By_Time_Print,Sell_By_Date=@Sell_By_Date,Sell_By_Date_Print=@Sell_By_Date_Print,Sell_By_Time=@Sell_By_Time,Sell_By_Time_Print=@Sell_By_Time_Print,Use_By_Date=@Use_By_Date,Use_By_Date_Print=@Use_By_Date_Print,Image1=@Image1,Image2=@Image2,Image3=@Image3,Image4=@Image4,User_ID_FK=@User_ID_FK,Settings_ID_FK=@Settings_ID_FK,CharEncoding=@CharEncoding,EAN_Data=@EAN_Data, TWS_BIN_SM100=@TWS_BIN_SM100, TWS_BIN_SM300=@TWS_BIN_SM300, TWS_BIN_SM5500=@TWS_BIN_SM5500, TWS_BIN_SM500=@TWS_BIN_SM500, TWS_BIN_DPS=@TWS_BIN_DPS, TWS_BIN_SM5500_Merged=@TWS_BIN_SM5500_Merged WHERE PLU_ID=@PLU_ID
 end
 ----
 go
 ----
Create Proc EditPLU_Ingrid
@PLU_ID int,
@SP_Message varchar(50),
@Ingrd1 varchar(300),
@Ingrd2 varchar(300),
@Ingrd3 varchar(300),
@Ingrd4 varchar(300),
@Ingrd5 varchar(300),
@Ingrd6 varchar(300),
@Ingrd7 varchar(300),
@Ingrd8 varchar(300),
@Ingrd9 varchar(300),
@Ingrd10 varchar(300),
@Ingrd11 varchar(300),
@Ingrd12 varchar(300),
@Ingrd13 varchar(300),
@Ingrd14 varchar(300),
@Ingrd15 varchar(300),
@Ingrd16 varchar(300),
@Ingrd17 varchar(300),
@Ingrd18 varchar(300),
@Ingrd19 varchar(300),
@TWS_BIN_SM100 varchar(8000),
@TWS_BIN_SM300 varchar(8000),
@TWS_BIN_SM5500 varchar(8000),
@TWS_BIN_SM500 varchar(8000),
@TWS_BIN_DPS varchar(8000),
@TWS_BIN_SM5500_Merged varchar(8000)

 as
 begin
 Update PLU
 Set SP_Message=@SP_Message,Ingrd1=@Ingrd1,Ingrd2=@Ingrd2,Ingrd3=@Ingrd3,Ingrd4=@Ingrd4,Ingrd5=@Ingrd5,Ingrd6=@Ingrd6,Ingrd7=@Ingrd7,Ingrd8=@Ingrd8,Ingrd9=@Ingrd9,Ingrd10=@Ingrd10,Ingrd11=@Ingrd11,Ingrd12=@Ingrd12,Ingrd13=@Ingrd13,Ingrd14=@Ingrd14,Ingrd15=@Ingrd15,Ingrd16=@Ingrd16,Ingrd17=@Ingrd17,Ingrd18=@Ingrd18,Ingrd19=@Ingrd19,TWS_BIN_SM100=@TWS_BIN_SM100, TWS_BIN_SM300=@TWS_BIN_SM300, TWS_BIN_SM5500=@TWS_BIN_SM5500, TWS_BIN_SM500=@TWS_BIN_SM500, TWS_BIN_DPS=@TWS_BIN_DPS, TWS_BIN_SM5500_Merged=@TWS_BIN_SM5500_Merged WHERE PLU_ID=@PLU_ID
 end
 ----
 go
 ----
 Create Proc Import
@Import_Setting_ID int,
@Import_Path varchar(300),
@File_Type varchar(50),
@Customer_Name varchar(50),
@Delete_DB int

 as
 begin
 update Import_Setting
 Set Import_Path=@Import_Path, File_Type=@File_Type, Customer_Name=@Customer_Name, Delete_DB=@Delete_DB  where Import_Setting_ID=@Import_Setting_ID
 end
 ----
 go
 ----
 Create Proc Update_Setting
 @Settings_ID int,
 @Type varchar(50),
 @Barcode_Format int,
 @Use_By_Date int,
 @Use_By_Date_Print int,
 @Label_Format int,
 @Font int,
 @Font_Ingrdeint int,
 @Flag varchar(50),
 @Sell_By_Date int,
 @Sell_By_Date_Print int,
 @Pack_Time int,
 @Pack_Time_Print int,
 @Sell_By_Time int,
 @Sell_By_Time_Print int,
 @Font_DP int,
 @Font_DP_Ingrd int,
 @MultiSection varchar(50),
 @Import_Setting_ID_FK int
 as
 begin
 Update Settings
 Set Type=@Type,Barcode_Format=@Barcode_Format,Use_By_Date=@Use_By_Date,Use_By_Date_Print=@Use_By_Date_Print,Label_Format=@Label_Format,Font=@Font,Font_Ingrdeint=@Font_Ingrdeint,Flag=@Flag,Sell_By_Date=@Sell_By_Date,Sell_By_Date_Print=@Sell_By_Date_Print,Pack_Time=@Pack_Time,Pack_Time_Print=@Pack_Time_Print,Sell_By_Time=@Sell_By_Time,Sell_By_Time_Print=@Sell_By_Time_Print, Font_DP=@Font_DP, Font_DP_Ingrd=@Font_DP_Ingrd, MultiSection=@MultiSection, Import_Setting_ID_FK=@Import_Setting_ID_FK WHERE Settings_ID=@Settings_ID
 end
----
 go
 ----
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(1,'F1F2 CCCCC XCD XXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(2,'F2 CCCCCC XCD XXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(3,'F1F2 CCCCC 0 XXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(4,'F1F2 CCCCCC XXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(5,'F1F2 CCCCC XXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(6,'F2 CCCCCC XXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(7,'F2 CCCCC XXXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(8,'F1F2 CCCCCCCCCC CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(9,'F1F2 CCCC XXXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(10,'F1F2 CCCCC CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(11,'F2 CC XXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(12,'No Barcode')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(13,'F1X2 CCCCC XCD XXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(14,'F1X2 CCCCCC XXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(15,'F1F2 CCCC XCD XXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(16,'F2 CCCCC XCD XXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(17,'F1F2 CCC XXXXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(18,'F1F2 CC XXXXXXXX CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(19,'CCC WWWW PPPPP CD')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(20,'No Barcode')
 insert into Barcode_Format(Barcode_Format_ID,Barcode_Format_Name) Values(21,'F1F2 CCCCC PCD XXXX CD')
----
go
----
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(0,'Default')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(1,'A')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(2,'B')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(3,'C')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(4,'U2')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(5,'U3')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(6,'U4')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(7,'U5')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(8,'U6')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(9,'U7')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(10,'U8')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(11,'T5')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(12,'T6')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(13,'T7')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(14,'T8')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(15,'T9')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(16,'T10')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(17,'F1')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(18,'F2')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(19,'F3')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(20,'F4')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(21,'F5')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(22,'F6')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(23,'F7')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(24,'F8')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(25,'F9')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(26,'F10')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(27,'F11')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(28,'F12')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(29,'F13')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(30,'F14')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(31,'F15')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(32,'F16')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(33,'F17')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(34,'F18')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(35,'F19')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(36,'F20')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(37,'F21')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(38,'F22')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(39,'F23')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(40,'F24')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(41,'F25')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(42,'F26')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(43,'F27')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(44,'F28')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(45,'F29')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(46,'F30')

insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(47,'F31')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(48,'F32')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(49,'F33')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(50,'F34')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(51,'F45')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(52,'F36')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(53,'F37')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(54,'F38')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(55,'F39')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(56,'F40')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(57,'F41')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(58,'F42')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(59,'F43')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(60,'F44')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(61,'F45')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(62,'F46')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(63,'F47')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(64,'F48')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(65,'F49')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(66,'F50')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(67,'F51')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(68,'F52')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(69,'F53')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(70,'F54')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(71,'F55')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(72,'F56')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(73,'F57')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(74,'F58')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(75,'F59')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(76,'F60')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(77,'F61')

insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(78,'F62')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(79,'F63')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(80,'F64')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(81,'F65')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(82,'F66')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(83,'F67')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(84,'F68')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(85,'F69')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(86,'F70')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(87,'F71')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(88,'F72')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(89,'F73')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(90,'F74')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(91,'F75')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(92,'F76')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(93,'F77')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(94,'F78')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(95,'F79')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(96,'F80')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(97,'F81')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(98,'F82')
insert into Label_Format(Label_Format_ID,Label_Format_Name) Values(99,'F83')
----
go
----
insert into Font(Font_ID,Font_Name) values(0,'S1')
insert into Font(Font_ID,Font_Name) values(1,'S2')
insert into Font(Font_ID,Font_Name) values(2,'S3')
insert into Font(Font_ID,Font_Name) values(3,'S4')
insert into Font(Font_ID,Font_Name) values(4,'S5')
insert into Font(Font_ID,Font_Name) values(5,'M1')
insert into Font(Font_ID,Font_Name) values(6,'M2')
insert into Font(Font_ID,Font_Name) values(7,'M3')
insert into Font(Font_ID,Font_Name) values(8,'M4')
insert into Font(Font_ID,Font_Name) values(9,'M5')
insert into Font(Font_ID,Font_Name) values(16,'G1')
insert into Font(Font_ID,Font_Name) values(17,'G2')
insert into Font(Font_ID,Font_Name) values(14,'G3')
insert into Font(Font_ID,Font_Name) values(15,'G4')
insert into Font(Font_ID,Font_Name) values(18,'G5')
insert into Font(Font_ID,Font_Name) values(19,'G6')
insert into Font(Font_ID,Font_Name) values(34,'T1')
insert into Font(Font_ID,Font_Name) values(35,'T2')
insert into Font(Font_ID,Font_Name) values(36,'T3')
insert into Font(Font_ID,Font_Name) values(37,'T4')
insert into Font(Font_ID,Font_Name) values(38,'T5')
insert into Font(Font_ID,Font_Name) values(39,'T6')
insert into Font(Font_ID,Font_Name) values(40,'T7')
insert into Font(Font_ID,Font_Name) values(41,'T8')
insert into Font(Font_ID,Font_Name) values(42,'T9')
insert into Font(Font_ID,Font_Name) values(43,'T10')
insert into Font(Font_ID,Font_Name) values(44,'T11')


----
GO
----
insert into Import_Setting(Import_Setting_ID, Import_Path,File_Type,Customer_Name, Delete_DB) values(1,'C:\Scales_Cloud','XLS','Carrefour','1')
-----
go
----
insert into Settings(Settings_ID,Type,Barcode_Format,Use_By_Date,Use_By_Date_Print,Label_Format,Font,Font_Ingrdeint,Flag,Sell_By_Date,Sell_By_Date_Print,Pack_Time,Pack_Time_Print,Sell_By_Time,Sell_By_Time_Print,Font_DP,Font_DP_Ingrd,MultiSection,Import_Setting_ID_FK) values(1,'WEIGH',5,0,1,17,6,6,21,0,1,0,1,0,1,17,17,'2D4P',1)
----
go
----
insert into Scale_Brand(Scale_Brand_ID, Scale_Brand_Name) values(1,'DIGI')
----
go
----
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(1,'SM100')
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(2,'SM300')
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(3,'SM500')
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(4,'SM5500')
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(5,'DPS')
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(6,'SM_Multi Section')
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(7,'SM5300')
insert into Scale_Model(Scale_Model_ID, Scale_Model_Name) values(8,'SM120')
----
go
----
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(50,'Deli(50)','Delicatessen',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(51,'Dairy(51)','Dairy',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(52,'Butchery(52)','Butchery',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(53,'Fishery(53)','Fishery',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(54,'Bakery(54)','Bakery',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(55,'Pastry(55)','Pastry',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(56,'F&V(56)','Fresh vegetables',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(57,'Coffee Shop(57)','Coffee Sho',1)
insert into Main_Group(Main_Group_Code, Main_Group_Name,Main_Group_description,Dept_ID_FK) values(997,'Default','Default',1)

----
insert into Licence(Licence_Key) Values('')
-----
go
---
Create Proc Edit_Key
@Licence_ID int,
@Licence_Key varchar(50)
 as
 begin
 update Licence
 Set Licence_Key=@Licence_Key where Licence_ID=@Licence_ID
 end
 -----
 go
 -----
 Create Proc EditPLU_Message
@PLU_ID int,
@SP_Message varchar(50)
 as
 begin
 update PLU
 Set SP_Message=@SP_Message where PLU_ID=@PLU_ID
 end
 ----
 go
 ----
 Create Table Preset_Key
 (
 Scale_ID_FK int,
 P_Key varchar(50),
 Assigned_PLU varchar(50)
 )
 ---
 go
 ----
 Create Table Preset_Type
(
Preset_ID int primary key,
Preset_Name varchar(50)
)
----
 go
----
Alter table Preset_Key
Add constraint FK_Preset_Key_Scales foreign key (Scale_ID_FK) references Scales(Scale_ID)
on update cascade
on delete cascade; 
----
go
----
Alter table Scales
Add constraint FK_Preset_Type_Scales foreign key (Preset_Key_FK) references Preset_Type(Preset_ID)
on update cascade
on delete cascade; 
----
go
----
go
----
insert into Preset_Type(Preset_ID,Preset_Name) values(78,'78')
insert into Preset_Type(Preset_ID,Preset_Name) values(101,'101')
insert into Preset_Type(Preset_ID,Preset_Name) values(96,'96')
----
 go
 ----
Create Proc Add_Pkey
 @Scale_ID_FK int,
 @P_Key varchar(50),
 @Assigned_PLU varchar(50)
 as
 begin
 insert into Preset_Key(Scale_ID_FK,P_Key,Assigned_PLU)
 values(@Scale_ID_FK,@P_Key,@Assigned_PLU)
 end
 ----
 go
 ----
Create Proc Edit_Pkey
 @Scale_ID_FK int,
 @P_Key varchar(50),
 @Assigned_PLU varchar(50)
 as
 begin
 update Preset_Key
 Set P_Key=@P_Key,Assigned_PLU=@Assigned_PLU where Scale_ID_FK=@Scale_ID_FK
 end
 ----
 go
 ----
 Create Table Font_Settings
 (
 Settings_ID_FK int primary key,
 SM100_Commodity int,
 SM100_SP int,
 SM100_Ingrd int,
 SM300_Commodity int,
 SM300_SP int,
 SM300_Ingrd int,
 SM500_Commodity int,
 SM500_SP int,
 SM500_Ingrd int,
 SM5500_Commodity int,
 SM5500_SP int,
 SM5500_Ingrd int,
 DPS_Commodity int,
 DPS_SP int,
 DPS_Ingrd int,
 SM5300_Commodity int,
 SM5300_SP int,
 SM5300_Ingrd int,
 SM120_Commodity int,
 SM120_SP int,
 SM120_Ingrd int,
 MS_Commodity int,
 MS_SP int,
 MS_Ingrd int
 )

---
go
---
insert into Font_Settings(Settings_ID_FK,SM100_Commodity,SM100_Ingrd,SM100_SP,SM300_Commodity,SM300_Ingrd,SM300_SP,SM500_Commodity,
SM500_Ingrd, SM500_SP,SM5500_Commodity, SM5500_Ingrd, SM5500_SP, DPS_Commodity, DPS_Ingrd, DPS_SP, SM5300_Commodity, SM5300_Ingrd, SM5300_SP,
SM120_Commodity,SM120_Ingrd, SM120_SP, MS_Commodity, MS_Ingrd, MS_SP) values(1,5,5,5,5,34,34,5,34,34,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5)
---
 go
----
Create Proc Edit_Font_Settings
 @Settings_ID_FK int,
 @SM100_Commodity int,
 @SM100_SP int,
 @SM100_Ingrd int,
 @SM300_Commodity int,
 @SM300_SP int,
 @SM300_Ingrd int,
 @SM500_Commodity int,
 @SM500_SP int,
 @SM500_Ingrd int,
 @SM5500_Commodity int,
 @SM5500_SP int,
 @SM5500_Ingrd int,
 @DPS_Commodity int,
 @DPS_SP int,
 @DPS_Ingrd int,
 @SM5300_Commodity int,
 @SM5300_SP int,
 @SM5300_Ingrd int,
 @SM120_Commodity int,
 @SM120_SP int,
 @SM120_Ingrd int,
 @MS_Commodity int,
 @MS_SP int,
 @MS_Ingrd int
 as
 begin
 update Font_Settings
 Set SM100_Commodity=@SM100_Commodity,
 SM100_SP=@SM100_SP,
 SM100_Ingrd=@SM100_Ingrd,
 SM300_Commodity=@SM300_Commodity,
 SM300_SP=@SM300_SP,
 SM300_Ingrd=@SM300_Ingrd,
 SM500_Commodity=@SM500_Commodity,
 SM500_SP=@SM500_SP,
 SM500_Ingrd=@SM500_Ingrd,
 SM5500_Commodity=@SM5500_Commodity,
 SM5500_SP=@SM5500_SP,
 SM5500_Ingrd=@SM5500_Ingrd,
 DPS_Commodity=@DPS_Commodity,
 DPS_SP=@DPS_SP,
 DPS_Ingrd=@DPS_Ingrd,
 SM5300_Commodity=@SM5300_Commodity,
 SM5300_SP=@SM5300_SP,
 SM5300_Ingrd=@SM5300_Ingrd,
 SM120_Commodity=@SM120_Commodity,
 SM120_SP=@SM120_SP,
 SM120_Ingrd=@SM120_Ingrd,
 MS_Commodity=@MS_Commodity,
 MS_SP=@MS_SP,
 MS_Ingrd=@MS_Ingrd where Settings_ID_FK=@Settings_ID_FK
 end
 ----
 go
----
 Create Table LF_Field
(
Field_ID int primary key,
Field_Name varchar(50),
Item int,
Total int,
Char_Size_X2X4 int,
Cent_Type int,
X_Position int,
Y_Position int,
Angle int,
Print_Status int,
Char_Size int,
Width int,
Height int,
Thickness int,
X1_Position int,
Y1_Position int,
Linked# int
)
 ----
 go
----
Create Table Print_Format_File
(
Scale_Type varchar(50),
Format_ID int primary key,
Label_Type varchar(50),
Flag_Delete int,
Label_Width varchar(50),
Label_Height varchar(50),
Label_Angle int
)
 ----
 go
----
 Create Table Print_Format_Field_File
(
Format_ID_FK int,
Field_ID_FK int,
Y_Position varchar(50),
Flag_Delete int,
X_Position varchar(50),
Angle int,
Print_Status int,
Char_Size_ID_FK int,
Width varchar(50),
Height varchar(50),
Thickness int,
X1_Position varchar(50),
Y1_Position varchar(50),
Linked# varchar(50),
Char_Size_X2X4 int,
Cent_Type int
)
 ----
 go
----
 Create Table Char_Size
(
Char_Size_ID int primary key,
Size_Name varchar(50),
Size varchar(50)
)
----
 go
----
 Create Table TEX0
(
ID int primary key identity(1,1),
Format_ID_FK int,
Text_ID int,
Line_Number int,
Text_Data varchar(100),
Char_Size_ID_FK int
)
----
 go
----
Alter table TEX0
Add constraint FK_Print_Format_Tex0 foreign key (Format_ID_FK) references Print_Format_File(Format_ID)
on update cascade
on delete cascade;
----
 go
----
Alter table TEX0
Add constraint FK_Print_Format_Tex foreign key (Char_Size_ID_FK) references Char_Size(Char_Size_ID)
on update cascade
on delete cascade;
----
 go
----
Alter table Print_Format_Field_File
Add constraint FK_Print_Format_Field_PrintF_File foreign key (Format_ID_FK) references Print_Format_File(Format_ID)
on update cascade
on delete cascade;
----
 go
----
Alter table Print_Format_Field_File
Add constraint FK_Print_Format_Field_PrintF_File1 foreign key (Field_ID_FK) references LF_Field(Field_ID)
on update cascade
on delete cascade; 
----
 go
----
Alter table Print_Format_Field_File
Add constraint FK_Print_Format_Field_PrintF_File2 foreign key (Char_Size_ID_FK) references Char_Size(Char_Size_ID)
on update cascade;
----
 go
----
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(0,'S1','5X7')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(1,'S2','6X10')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(2,'S3','7X12')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(3,'S4','7X16')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(4,'S5','9X22')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(5,'M1','10 × 14')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(6,'M2','12 × 20')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(7,'M3','14 × 24')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(8,'M4','14 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(9,'M5','18 × 44')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(80,'X1 (for receipt only)','5 × 14')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(81,'X2 (for receipt only)','6 × 20')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(82,'X3 (for receipt only)','7 × 24')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(83,'X4 (for receipt only)','7 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(84,'X5 (for receipt only)','9 × 44')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(10,'B1','24 × 24')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(11,'B2','48 × 48')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(26,'B3','24 × 48')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(27,'B4','16 × 15')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(28,'B5','16 × 30')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(29,'B6','32 × 30')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(16,'J1','16 × 16')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(17,'J2','16 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(18,'J3','32 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(19,'J4','24 × 24')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(22,'G1','24 × 24')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(23,'G2','48 × 48')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(20,'G3','16 × 16')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(21,'G4','32 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(24,'G5','16 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(25,'G6','24 × 48')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(30,'T1','16 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(31,'T2','16 × 64')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(32,'T3','32 × 64')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(96,'TX (for receipt only)','8 x 16')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(33,'K1','16 × 16')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(34,'K2','16 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(35,'K3','32 × 32')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(36,'K4','24 × 24')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(37,'K5','24 × 48')
insert into Char_Size(Char_Size_ID,Size_Name,Size) values(38,'K6','48 × 48')

---
go
---

insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(001,'PLU NO',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(002,'PRICE (-TAX)',1,1,1,1,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(003,'UNIT PRICE',1,0,1,1,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(004,'WEIGHT',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(005,'QUANTITY',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(006,'PACKED DATE',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(007,'PACKED TIME',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(008,'COMMODITY',1,0,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(009,'QUANTITY UNIT',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(010,'SELL DATE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(011,'SELL TIME',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(012,'BARCODE',1,1,0,0,1,1,1,1,0,0,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(013,'SHOP NAME',1,0,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(014,'DISCOUNT VALUE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(015,'USED DATE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(016,'LOGO',1,0,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(017,'MAIN GROUP CODE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(018,'DEPARTMENT CODE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(019,'SCALE NUMBER',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(020,'INGREDIENT',1,0,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(021,'SPECIAL MESSAGE',1,0,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(220,'FRAME 1',1,0,0,0,1,1,0,1,0,0,0,1,1,1,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(221,'FRAME 2',1,0,0,0,1,1,0,1,0,0,0,1,1,1,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(024,'TARE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(025,'CLERK',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(260,'TEXT 1',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(261,'TEXT 2',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(262,'TEXT 3',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(263,'TEXT 4',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(264,'TEXT 5',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(265,'TEXT 6',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(266,'TEXT 7',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(267,'TEXT 8',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(268,'TEXT 9',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(269,'TEXT 10',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(270,'TEXT 11',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(271,'TEXT 12',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(272,'TEXT 13',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(273,'TEXT 14',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(274,'TEXT 15',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(275,'TEXT 16',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(276,'TEXT 17',0,1,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(277,'TEXT 18',0,1,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(278,'TEXT 19',0,1,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(279,'TEXT 20',0,1,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(046,'PRICE (+ TAX)',1,1,1,1,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(047,'TAX RATE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(048,'PLACE',1,0,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(490,'IMAGE 1',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(491,'IMAGE 2',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(492,'IMAGE 3',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(493,'IMAGE 4',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(494,'IMAGE 5',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(495,'IMAGE 6',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(496,'IMAGE 7',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(497,'IMAGE 8',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(498,'IMAGE 9',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(499,'IMAGE 10',1,0,0,0,1,1,1,1,0,1,1,0,0,0,1)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(059,'PRICE BEFORE DISCOUNT',1,0,1,1,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(060,'UNIT PRICE BEFORE DISCOUNT',1,0,1,1,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(061,'AVERAGE PRICE',1,0,1,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(062,'AVERAGE WEIGHT',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(063,'GROSS WEIGHT',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(064,'EURO UNIT PRICE',1,0,0,1,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(065,'EURO TOTAL PRICE',1,1,0,1,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(066,'BORN COUNTRY',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(067,'FATTEN COUNTRY',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(068,'SLAUGTHER HOUSE',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(069,'CUTTING HALL',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(070,'REFER NO',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(071,'ORIGIN',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(072,'KIND',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(073,'CATEGORY',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(074,'BREED',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(075,'CONTACT',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(076,'GTIN',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(077,'SUPPLIER CODE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(078,'SUPPLIER NAME',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(079,'SUPPLIER ADDRESS 1',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(080,'SUPPLIER ADDRESS 2',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(081,'TEMPERATURE',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(082,'MULTI BARCODE 1',1,1,0,0,1,1,1,1,0,0,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(083,'MULTI BARCODE 2',1,1,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(084,'SERIAL NO',1,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(085,'TOTAL TITLE',0,1,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(086,'EXCLUDED TAX AMOUNT',0,1,1,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(087,'INCLUDED TAX AMOUNT',0,1,1,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(088,'ADVERTISEMENT',1,0,0,0,1,1,1,1,0,1,1,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(901,'Serving size',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(902,'Serving container',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(903,'Selection of 100g / 100ml',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(904,'Unit weight portion',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(905,'Number of portions',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(906,'Energy (kCal)',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(907,'Energy (kJ)',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(908,'Energy %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(909,'Total fat',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(910,'Total fat %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(911,'Saturate fat',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(912,'Saturate fat %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(913,'Carbohydrate',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(914,'Carbohydrate %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(915,'Sugars',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(916,'Sugars %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(917,'Protein',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(918,'Protein %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(919,'Salt',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(920,'Salt %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(921,'Vitamin A',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(922,'Vitamin A %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(923,'Vitamin D',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(924,'Vitamin D %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(925,'Vitamin E',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(926,'Vitamin E %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(927,'Vitamin K',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(928,'Vitamin K %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(929,'Vitamin C',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(930,'Vitamin C %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(931,'Thiamine',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(932,'Thiamine %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(933,'Riboflavin',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(934,'Riboflavin %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(935,'Niacin',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(936,'Niacin %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(937,'Vitamin B6',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(938,'Vitamin B6 %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(939,'Folic acid',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(940,'Folic acid %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(941,'Vitamin B12',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(942,'Vitamin B12 %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(943,'Biotin',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(944,'Biotin %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(945,'Pantothenic acid',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(946,'Pantothenic acid %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(947,'Potassium',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(948,'Potassium %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(949,'Chloride',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(950,'Chloride %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(951,'Calcium',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(952,'Calcium %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(953,'Phosphorus',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(954,'Phosphorus %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(955,'Magnesium',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(956,'Magnesium %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(957,'Iron',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(958,'Iron %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(959,'Zinc',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(960,'Zinc %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(961,'Copper',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(962,'Copper %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(963,'Manganese',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(964,'Manganese %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(965,'Fluoride',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(966,'Fluoride %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(967,'Selenium',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(968,'Selenium %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(969,'Chromium',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(970,'Chromium %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(971,'Molybdenum',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(972,'Molybdenum %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(973,'Lodine',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
insert into LF_Field(Field_ID,Field_Name,Item,Total,Char_Size_X2X4,Cent_Type,X_Position,Y_Position,Angle,Print_Status,Char_Size,Width,Height,Thickness,X1_Position,Y1_Position,Linked#) values(974,'Lodine %',1,0,0,0,1,1,1,1,1,0,0,0,0,0,0)
 ----
 go
 ----
 Create Proc Add_Print_Format_File
@Scale_Type varchar(50),
@Format_ID int,
@Label_Type varchar(50),
@Flag_Delete int,
@Label_Width varchar(50),
@Label_Height varchar(50),
@Label_Angle int
 as
 begin
 insert into Print_Format_File (Scale_Type,Format_ID,Label_Type,Flag_Delete,Label_Width,Label_Height,Label_Angle)
 values (@Scale_Type,@Format_ID,@Label_Type,@Flag_Delete,@Label_Width,@Label_Height,@Label_Angle)
 end
 ----
 go
 ----
 Create Proc Edit_Print_Format_File
@Scale_Type varchar(50),
@Format_ID int,
@Label_Type varchar(50),
@Flag_Delete int,
@Label_Width varchar(50),
@Label_Height varchar(50),
@Label_Angle int
 as
 begin
 update Print_Format_File
 Set Scale_Type=@Scale_Type, Label_Type=@Label_Type, Flag_Delete=@Flag_Delete,Label_Width=@Label_Width,Label_Height=@Label_Height,Label_Angle=@Label_Angle where Format_ID=@Format_ID
 end
 ----
 go
 ----
Create Proc Add_Print_Format_Field_File
@Format_ID_FK int,
@Field_ID_FK int,
@Y_Position varchar(50),
@Flag_Delete int,
@X_Position varchar(50),
@Angle int,
@Print_Status int,
@Char_Size_ID_FK int,
@Width varchar(50),
@Height varchar(50),
@Thickness int,
@X1_Position varchar(50),
@Y1_Position varchar(50),
@Linked# varchar(50),
@Char_Size_X2X4 int,
@Cent_Type int
 as
 begin
 insert into Print_Format_Field_File (Format_ID_FK,Field_ID_FK,Y_Position,Flag_Delete,X_Position,Angle,Print_Status,Char_Size_ID_FK,Width,Height,Thickness, X1_Position, Y1_Position, Linked#, Char_Size_X2X4, Cent_Type)
 values (@Format_ID_FK,@Field_ID_FK,@Y_Position,@Flag_Delete,@X_Position,@Angle,@Print_Status,@Char_Size_ID_FK,@Width,@Height,@Thickness,@X1_Position, @Y1_Position, @Linked#, @Char_Size_X2X4, @Cent_Type)
 end
 ----
 go
 ----
 ----
 go
 ----
Create Proc Edit_Print_Format_Field_File
@Format_ID_FK int,
@Field_ID_FK int,
@Y_Position varchar(50),
@Flag_Delete int,
@X_Position varchar(50),
@Angle int,
@Print_Status int,
@Char_Size_ID_FK int,
@Width varchar(50),
@Height varchar(50),
@Thickness int,
@X1_Position varchar(50),
@Y1_Position varchar(50),
@Linked# varchar(50),
@Char_Size_X2X4 int,
@Cent_Type int
 as
 begin
 Update Print_Format_Field_File
 Set Format_ID_FK=@Format_ID_FK,Field_ID_FK=@Field_ID_FK,Y_Position=@Y_Position,Flag_Delete=@Flag_Delete,X_Position=@X_Position,Angle=@Angle,Print_Status=@Print_Status,Char_Size_ID_FK=@Char_Size_ID_FK,Width=@Width,Height=@Height,Thickness=@Thickness,X1_Position=@X1_Position,Y1_Position=@Y1_Position, Linked#=@Linked#, Char_Size_X2X4=@Char_Size_X2X4,Cent_Type=@Cent_Type where Field_ID_FK=@Field_ID_FK And Format_ID_FK=@Format_ID_FK
 end
 ----
 go
 ----
Create Table Char_Size_X
(
X_ID int primary key,
Size_Name varchar(50)
)
----
 go
 ---
Create Table Char_Cent
(
Cent_ID int primary key,
Cent_Name varchar(50)
)
----
 go
 ---
 insert into Char_Size_X(X_ID,Size_Name) Values(0,'N')
 insert into Char_Size_X(X_ID,Size_Name) Values(1,'X2')
 insert into Char_Size_X(X_ID,Size_Name) Values(2,'X4')
 ---
 go
 ---
 insert into Char_Cent(Cent_ID,Cent_Name) Values(0,'N')
 insert into Char_Cent(Cent_ID,Cent_Name) Values(1,'Up')
 insert into Char_Cent(Cent_ID,Cent_Name) Values(2,'Down')
 ---
 go
 ----
Create Table Angle
(
ID int primary key,
Angle_Name varchar(50)
)
----
 go
 ---
Create Table Print_Status
(
ID int primary key,
Print_Name varchar(50)
)
----
 go
 ---
 insert into Angle(ID,Angle_Name) Values(0,'0')
 insert into Angle(ID,Angle_Name) Values(1,'90')
 insert into Angle(ID,Angle_Name) Values(2,'180')
 insert into Angle(ID,Angle_Name) Values(3,'270')
 ---
 go
 ---
 insert into Print_Status(ID,Print_Name) Values(7,'All')
 insert into Print_Status(ID,Print_Name) Values(3,'W')
 insert into Print_Status(ID,Print_Name) Values(0,'N')
 insert into Print_Status(ID,Print_Name) Values(4,'Q')
 ----
 go
 ---
Create Table Font_Thickness
(
ID int primary key,
Name varchar(50)
)
----
 go
 ---
 insert into Font_Thickness(ID,Name) Values(0,'0')
insert into Font_Thickness(ID,Name) Values(1,'1')
insert into Font_Thickness(ID,Name) Values(2,'2')
insert into Font_Thickness(ID,Name) Values(3,'3')
insert into Font_Thickness(ID,Name) Values(4,'4')
insert into Font_Thickness(ID,Name) Values(5,'5')
insert into Font_Thickness(ID,Name) Values(6,'6')
insert into Font_Thickness(ID,Name) Values(7,'7')
insert into Font_Thickness(ID,Name) Values(8,'8')
insert into Font_Thickness(ID,Name) Values(9,'9')
 
