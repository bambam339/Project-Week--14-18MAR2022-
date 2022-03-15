#Create an OU with Accidental Deletion Protection
$ADou = "A1"
New-ADOrganizationalUnit -Name:$ADou -Path:"DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"
Set-ADObject -Identity:"OU=$ADou,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"

#Delete an OU with Accidental Deletion Protection
$OU= 'A1'
Set-ADObject -Identity:"OU=$OU,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$false -Server:"LON-DC1.Adatum.com"
Remove-ADObject -Confirm:$false -Identity:"OU=$OU,DC=Adatum,DC=com" -Server:"LON-DC1.Adatum.com"