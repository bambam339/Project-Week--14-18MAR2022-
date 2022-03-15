#Create a Global Security Group with Accidental Deletion Protection
$NewGroup = "NewGroup"
New-ADGroup -GroupCategory:"Security" -GroupScope:"Global" -Name:$NewGroup -Path:"DC=Adatum,DC=com" -SamAccountName:$NewGroup -Server:"LON-DC1.Adatum.com"
Set-ADObject -Identity:"CN=NewGroup,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"

#Delete a Global Security Group with Accidental Deletion Protection
$DeleteGroup = "NewGroup"
Set-ADObject -Identity:"CN=$DeleteGroup,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$false -Server:"LON-DC1.Adatum.com"
Remove-ADObject -Confirm:$false -Identity:"CN=$DeleteGroup,DC=Adatum,DC=com" -Server:"LON-DC1.Adatum.com"

#Create Multiple Groups with Accidental Protection Deletion
$NewGroups = @('A1','A2','A3')
foreach ($Group in $NewGroups)
{
New-ADGroup -GroupCategory:"Security" -GroupScope:"Global" -Name:$Group -Path:"DC=Adatum,DC=com" -SamAccountName:$Group -Server:"LON-DC1.Adatum.com"
Set-ADObject -Identity:"CN=$Group,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$true -Server:"LON-DC1.Adatum.com"}

#Delete Multiple Groups with Accidental Protection Deletion
$DeleteGroups = @('A1','A2','A3')
foreach ($Group in $DeleteGroups)
{
Set-ADObject -Identity:"CN=$Group,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$false -Server:"LON-DC1.Adatum.com"
Remove-ADObject -Confirm:$false -Identity:"CN=$Group,DC=Adatum,DC=com" -Server:"LON-DC1.Adatum.com"}