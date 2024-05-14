#runtime_configuration.ps1
Add-OdbcDsn -Name "$env:DB_Server_NAME" -DriverName "ODBC Driver 17 for SQL Server" -DsnType "System" -Platform "32-bit" -SetPropertyValue @("Trusted_Connection=Yes", "Server=$env:SQL_SERVER_IP,$env:SERVER_PORT")
$env:COMPUTERNAME=hostname
$carpeta = 'C:\DBBSETUP\ScaleFiles'
Get-ChildItem -Path $carpeta -Filter *.ini -Recurse | ForEach-Object {
    $contenido = Get-Content -Path $_.FullName
    $contenido -replace '%hostname%',"$env:COMPUTERNAME" `
		| Set-Content -Path $_.FullName
}