# install_prerequisites.ps1
param (
    [string]$installPath = (Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "/install")
)
powershell -NoExit -Command "Start-Process powershell -Verb runAs"
C:\Windows\SysWOW64\WindowsPowerShell\v1.0\powershell.exe
$ExePattern = (Get-childitem -Path $installPath -Filter "VC*").Name
Foreach ($file in $ExePattern) {Start-Process $installPath\$file -ArgumentList /Q, /norestart -Wait -NoNewWindow }
Start-Process -Filepath "msiexec.exe" -ArgumentList "/i $installPath\Microsoft_SQL_Server_ODBC_Driver_17.3.1.1_x64.msi", "/qb", "IACCEPTMSODBCSQLLICENSETERMS=YES", "/norestart" -Wait -NoNewWindow