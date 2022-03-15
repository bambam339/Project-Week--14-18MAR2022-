#Create a New GPO from Starter GPO
$NewGPO = "New GPO"
$GPOUser = "OU=IT"
New-GPO -Name $NewGPO -StarterGpoName "IT Starter GPO"
New-GPLink -Name $NewGPO -Target "$GPOUser,DC=Adatum,DC=com"