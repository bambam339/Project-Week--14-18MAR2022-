
#20741B - Networking with Windows Server 2016
#1.Demo1 Configure IPv4
#Configuring IPv4 by using the user interface

#Check IP Address
Get-NetIPAddress -InterfaceAlias “London_Network”

#Remove IP Address
Remove-NetIPAddress -InterfaceAlias “London_Network” -IPAddress 172.16.0.111

#Add New IPAddress
New-NetIPAddress -InterfaceAlias “London_Network” -IPAddress 172.16.0.11 -PrefixLength 24 

#Enable DHCP for the adapter Local Area Connection
Set NetIPInterface –InterfaceAlias "Local Area Connection" –Dhcp Enabled 
Restart NetAdapter –Name "Local Area Connection" 