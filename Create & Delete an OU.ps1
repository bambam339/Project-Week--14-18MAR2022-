# This script is used for creating bulk organizational units.

# Import active directory module for running AD cmdlets
Import-Module activedirectory

#Store the data from the CSV in the $ADOU variable. 
$Parentname = @('Atlanta','Boston')
$Parentpath = "DC=Adatum,DC=com"

#Loop through each row containing user details in the CSV file
foreach ($ou in $ADou)
{
#Read data from each field in each row and assign the data to a variable as below
$name = $ou.name
$path = $ou.path

#Account will be created in the OU provided by the $OU variable read from the CSV file
New-ADOrganizationalUnit `
-Name $name `
-path $path `

}

$ADou = @('Test1','A2','A3')
$path = "DC=Adatum,DC=com"
foreach ($ou in $ADou)
New-ADOrganizationalUnit -Name:$ou -Path:"DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"
Set-ADObject -Identity:"OU=$ou,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"

#Create an OU with Accidental Deletion Protection
$ADou = "A1"
New-ADOrganizationalUnit -Name:$ADou -Path:"DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"
Set-ADObject -Identity:"OU=$ADou,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"

#Delete an OU with Accidental Deletion Protection
$OU= 'A1'
Set-ADObject -Identity:"OU=$OU,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$false -Server:"LON-DC1.Adatum.com"
Remove-ADObject -Confirm:$false -Identity:"OU=$OU,DC=Adatum,DC=com" -Server:"LON-DC1.Adatum.com"