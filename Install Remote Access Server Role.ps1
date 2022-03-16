#Install Remote Access Server Role
Install-WindowsFeature RemoteAccess -IncludeManagementTools

#Restart Computer
Restart-Computer

#Install Remote Access in Powershell
Install-WindowsFeature RSAT-RemoteAccess-PowerShell