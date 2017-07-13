
[CmdletBinding()]param(
    $database = "WideWorldImporters"
)
$ErrorActionPreference="Stop"


& $psscriptroot\Deploy.ps1 -Database $database -instance "DEFAULT" -server "localhost"