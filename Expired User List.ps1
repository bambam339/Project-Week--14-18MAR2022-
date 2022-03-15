#Display Expired User Accounts
$ThisDomain = "LON-DC1"
Search-ADAccount -Server $ThisDomain -Credential $Creds -AccountExpired -UsersOnly -ResultPageSize 2000 -resultSetSize $null| Select-Object Name, SamAccountName, DistinguishedName, AccountExpirationDate