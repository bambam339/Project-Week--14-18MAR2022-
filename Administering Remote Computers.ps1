#Connect to computers named ONE and TWO. Each of these computers will run Get-Service locally, returning their results by means of remoting.
Invoke-Command –ScriptBlock { Get-Service } –ComputerName ONE,TWO

#Stops all processes on remote computer, with only the final results being serialized and sent back
Invoke-Command –Computer LON-DC1 –ScriptBlock { Get-Process –Name Note* |
Stop-Process }

#add RSAT as a Windows feature
Add-WindowsFeature RSAT-AD-PowerShell
Import-Module ActiveDirectory

#To grant resource-based, Kerberos-constrained delegation from LON-SVR1 through LON-SVR2 to LON-SVR3
Set-ADComputer -Identity LON-SVR2 -PrincipalsAllowedToDelegateToAccount LON-SVR3

#Test constrained delegation
$cred = Get-Credential Adatum\TestUser
Invoke-Command -ComputerName LON-SVR1.Name -Credential $cred -ScriptBlock {Test-Path \\$($using:ServerC.Name)\C$            `
Get-Process lsass -ComputerName $($using:LON-SVR2.Name)
Get-EventLog -LogName System -Newest 3 -ComputerName $using:LON-SVR3.Name
}

#Enter a PSSession on LON-CL1
$client = New-PSSession –ComputerName LON-CL1
Enter-PSSession –Session $client
Exit-PSSession
#or
$computers = New-PSSession –ComputerName LON-CL1,LON-DC1
Invoke-Command –Session $computers –ScriptBlock { Get-Process }

$dc = New-PSSession –ComputerName LON-DC1
all = New-PSSession –ComputerName LON-DC1,LON-CL1, 
Invoke-Command –Session $all –ScriptBlock { Get-Service | Where { $_.Status –eq 'Running' }}

#Create a variable named $dc, which creates a PSSession
$dc = New-PSSession –ComputerName LON-DC1

#Disconnect from the PSSession
Disconnect-PSSession –Session $dc

#Open the disconnected PSSession
Get-PSSession –ComputerName LON-DC1

#Reconnect to the PSSession
Get-PSSession –ComputerName LON-DC1 | Connect-PSSession

#Close the PSSession
Remove-PSSession –Session $dc

