
New-PSDrive -PSProvider Registry -Name HKCR -Root HKEY_CLASSES_ROOT

if ( Test-Path 'HKCR:\ms-msdt') {
    
mkdir C:\RegBackup\Follina
reg export HKEY_CLASSES_ROOT\ms-msdt C:\RegBackup\Follina\ms-msdt.reg
reg delete HKEY_CLASSES_ROOT\ms-msdt /f
}

else {
    
Write-Host "Folina key not found!!"
}

Remove-PSDrive -Name HKCR