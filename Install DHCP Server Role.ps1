#1.Install the DHCP server role
Add-WindowsFeature DHCP

#Or Install the DHCP management console with DHCP server role
Add-WindowsFeature –IncludeManagementTools DHCP 

#2. Post-Installation
#Create the security groups
Netsh DHCP Add SecurityGroups

#Restart DHCP service
Restart-Service DHCPServer 