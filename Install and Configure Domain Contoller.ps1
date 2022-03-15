#Deploying AD DS
#1. Install AD DS Binaries
$Name = "LON-SVR1"
Install-WindowsFeature -Name AD-Domain-Service -ComputerName $Name

#Verify AD DS Role Installed
Get-WindowsFeature -ComputerName $Name

#
Add-WindowsFeature RSAT-ADDS

#2. Prepare for AD DS Installation & Promote a Remote Server
Install-ADDSDomainController
Invoke-Command -ComputerName

#Deploy Domain Controller
#1.Check Domain Controller Clone Prerequisites
Get-ADDCCloningExcludedApplicationList -GenerateXml

New-ADDCCloneConfigFile 

#2.Copy Source Domain Controller

#3.Perform DC Cloning


