@echo **************************************************
@title Scales Cloud Installation
@echo  Reset database
@echo **************************************************
sqlcmd -S .\SQLEXPRESS -i C:\Scales_Cloud\DataBase_Tools\Reset.sql
@echo  Create database
@echo **************************************************
