#Create a New GPO
$NewGPO = "New GPO"
$GPOUser = "OU=IT"
New-GPO -Name $NewGPO -Comment "This is a New GPO"
New-GPLink -Name $NewGPO -Target "$GPOUser,DC=Adatum,DC=com"