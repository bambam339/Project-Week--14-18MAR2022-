#Create Multiple OUs with Accidental Protection Deletion
$ADou = @('A1','A2','A3')
foreach ($ou in $ADou)
{
New-ADOrganizationalUnit -Name:$ou -Path:"DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com" |
Set-ADObject -Identity:"OU=$ou,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"}

#Delete an OU with Accidental Deletion Protection
$ADou = @('A1','A2','A3')
foreach ($ou in $ADou)
{
Set-ADObject -Identity:"OU=$OU,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$false -Server:"LON-DC1.Adatum.com"
Remove-ADObject -Confirm:$false -Identity:"OU=$OU,DC=Adatum,DC=com" -Server:"LON-DC1.Adatum.com"}