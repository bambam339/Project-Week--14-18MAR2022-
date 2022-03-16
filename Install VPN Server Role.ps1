#Install Remote Access as a RAS Gateway VPN Server
Install-WindowsFeature DirectAccess-VPN -IncludeManagementTools

#Retrieve Global VPN Profiles
Get-VPNConnection -AllUserConnection

#Retrieve all local VPN profiles
Get-VPNConnection 

#Enables split tunneling for the A. Datum VPN profile
Set-VpnConnection -name "A. Datum VPN" -AllUserConnection -SplitTunneling $true 

#Add VPN Connection
Add-VpnConnection -Name "Test1" -ServerAddress "10.1.1.1" -PassThru