#Create Multiple New Users 
$ADUsers = @("A B", "C D", "E F")
$Dept = "IT"
foreach ($User in $NewUsers)
{
New-ADUser -Company:"Adatum" -Department:$Dept -Name:$User} 

#Delete Multiple Users with Accidental Deletion Protection
$DelUsers = @("A B", "C D", "E F")
foreach ($User in $DelUsers)
{
Remove-ADObject -Confirm:$false -Identity:"CN=$User,CN=Users,DC=Adatum,DC=com" -Server:"LON-DC1.Adatum.com"
Set-ADObject -Identity:"CN=$User,CN=Users,DC=Adatum,DC=com" -ProtectedFromAccidentalDeletion:$false -Server:"LON-DC1.Adatum.com"
}