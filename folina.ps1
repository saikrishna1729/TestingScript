
New-PSDrive -PSProvider Registry -Name HKCR -Root HKEY_CLASSES_ROOT
$Logfile = "C:\RegBackup\Follina\Logs\$(Get-Date -Format dd-MM-yyyy).log"
$Computer = $env:COMPUTERNAME

if ( Test-Path 'C:\RegBackup\Follina')
{
    # Do nothing
}
else {
    mkdir C:\RegBackup\Follina\
    mkdir C:\RegBackup\Follina\Logs
    "$(Get-Date) :: Backup folder created" | Out-File -FilePath $Logfile -Append
}

if ( Test-Path 'HKCR:\ms-msdt') {

"$(Get-Date) :: Follina key found on $Computer" | Out-File -FilePath $Logfile -Append

"$(Get-Date) :: Backup file created for the key : C:\RegBackup\Follina\ms-msdt.reg" | Out-File -FilePath $Logfile -Append
    
reg export HKEY_CLASSES_ROOT\ms-msdt C:\RegBackup\Follina\ms-msdt.reg
"$(Get-Date) :: Deleting the key HKEY_CLASSES_ROOT\ms-msdt " | Out-File -FilePath $Logfile -Append
reg delete HKEY_CLASSES_ROOT\ms-msdt /f
"$(Get-Date) :: Exiting the script " | Out-File -FilePath $Logfile -Append
}

else {
    
    "$(Get-Date) :: Follina key not found " | Out-File -FilePath $Logfile -Append
}

Remove-PSDrive -Name HKCR