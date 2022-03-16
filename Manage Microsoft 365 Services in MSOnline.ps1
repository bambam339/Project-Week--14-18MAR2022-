#Install the Azure Active Directory Module
Install-Module MSOnline

#Connect to Microsoft 365
Connect-MSOnline

#Create a new user account and set a password in MSOnline
New-MsolUser -DisplayName "Abbie Parsons" -FirstName "Abbie" -LastName "Parsons" -UserPrincipalName AbbieP@adatum.com -Password "Pa55w.rd"

#Query a single Microsoft 365 user account
Get-MsolUser -UserPrincipalName AbbieP@adatum.com

#Query all user accounts in a Microsoft 365 tenant
Get-MsolUser -All

#Create a new security group
New-MsolGroup -DisplayName "Marketing Group"

#Add an account to the User Administrator role
Add-MsolRoleMember -RoleMemberEmailAddress AbbieP@adatum.com -RoleName 'User Administrator'

#Places all licenses in a variable, and then displays the service plans for the first item in the array
$sku = Get-MsolAccountSku
$sku[0].ServiceStatus

#Assigns a Microsoft 365 E3 to a user
Set-MsolUserLicense -UserPrincipalName "AbbieP@adatum.com" -AddLicenses "Adatum:SPE_E3"

#Disable the YAMMER_ENTERPRISE and SWAY service plans for a user
$planList = "YAMMER_ENTERPRISE","SWAY"
$licenseOptions=New-MsolLicenseOptions -AccountSkuId $accountSkuId -DisabledPlans $planList
Set-MsolUserLicense -UserPrincipalName "AbbieP@adatum.com" -LicenseOptions $licenseOptions

#Removes a Microsoft 365 E3 license from a user's account
Set-MsolUserLicense -UserPrincipalName "AbbieP@adatum.com" -RemoveLicenses "Adatum:SPE_E3"
