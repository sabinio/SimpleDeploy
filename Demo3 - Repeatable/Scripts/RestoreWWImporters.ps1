
#Download 
https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak

$sql = 
"RESTORE DATABASE [WideWorldImporters] FROM  DISK = N'C:\Users\SimonSabin\Downloads\WideWorldImporters-Full.bak'
 WITH  FILE = 1,  MOVE N'WWI_Primary' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters.mdf'
 ,  MOVE N'WWI_UserData' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters_UserData.ndf'
 ,  MOVE N'WWI_Log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters.ldf'
 ,  MOVE N'WWI_InMemory_Data_1' TO N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WideWorldImporters_InMemory_Data_1'
 ,  NOUNLOAD,  STATS = 5"
 $sql

#Script the database
