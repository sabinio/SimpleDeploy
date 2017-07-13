
[CmdletBinding()]param(
    $database = "WideWorldImporters"
)
$ErrorActionPreference="Stop"

& $psscriptroot\Deploy.ps1 -Database $database -instance "DEFAULT" -server "localhost" -datafilepath "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\" -DeleteDB:$DeleteDB
