
[CmdletBinding()]
param (
       [string] $Database
      ,[string] $Server
      ,[string] $Instance
      )
    Write-Verbose "------------------------------------------"
    Write-Verbose "Settings"
    Write-Verbose "Deploying to Server       $Server"
    Write-Verbose "Deploying to Instance     $Instance"
    Write-Verbose "Deploying to Database     $Database"
    Write-Verbose "Deploying to DataFilePath $DataFilePath"
    Write-Verbose "Dropping Database         $DeleteDB"
    Write-Verbose "------------------------------------------"

$env:PSModulePath+=";$(${env:ProgramFiles(x86)})\WindowsPowerShell\Modules\SqlServer"

if (-not (get-module sqlserver | Where-Object  Version -ge  "21.0.17151")){
    Write-Verbose "Installing SQL Server module"
    install-module sqlserver -force -AllowClobber -Verbose
    Write-Verbose "Module installed"
    Write-Verbose "====================================="
    import-module sqlserver
}

if($Instance -eq "Default"){
    $ServerInstance = $Server}
else{
    $ServerInstance="$Server`\$Instance"}


if (-not (test-path SQLSERVER:SQL\$server)){
    throw "SQL Server ($server) does not exist cannot continue" 
}

if (-not (test-path SQLSERVER:SQL\$server\$instance)){
    throw "SQL Server Instance ($instance) does not exist on ($server) cannot continue" 
}

#If database doesn't exist 
if (-not (test-path SQLSERVER:SQL\$server\$instance\databases\$database)){
    Write-verbose "Creating database $ServerInstance - $database"
    
    Invoke-Sqlcmd -ServerInstance "$ServerInstance" -Database "master"  -inputfile "$PSScriptRoot\..\WideWorldImporters_CreateDB.sql"

    Write-verbose "Applying Schema $ServerInstance - $database"
    Invoke-Sqlcmd -ServerInstance "$ServerInstance" -Database $database -InputFile "$PSScriptRoot\..\WideWorldImporters_Schema.sql"
}
else {
    Write-verbose "Database already exists $ServerInstance - $database"    
}
