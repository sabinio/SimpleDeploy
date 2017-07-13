
[CmdletBinding()]param(
    [switch] $DeleteDB
)
$ErrorActionPreference="Stop"

& $psscriptroot\Deploy.ps1 -Database "WW2" -instance "DEFAULT" -server "localhost" -datafilepath "C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\" -DeleteDB:$DeleteDB
