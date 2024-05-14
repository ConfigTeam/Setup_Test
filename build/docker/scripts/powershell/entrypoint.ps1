#entrypoint.ps1

param (
    [string]$applicationDirectory,
    [int]$applicationParameter
)

#executes runtime configuration
powershell -File "C:\runtime_configuration.ps1"

#changes working directory depending on the input parameter
$workingDirectory = "C:\DBBSetup\Batchscripts\$applicationDirectory"
Set-Location $workingDirectory

#executes runcc depending on the application type 
switch ( $applicationDirectory ) {
    'CoreIssue' { .\runccCI.bat $applicationParameter}
    'CoreAuth' { .\runccCoreAuth.bat $applicationParameter}
    'CoreApp' { .\runccCoreAPP.bat $applicationParameter}
    'CoreCollect' { .\runccCC.bat $applicationParameter}
    'CoreAcquire' { .\runcc.bat $applicationParameter}
}