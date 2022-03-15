#Create a New IP Address on Ethernet Interface
$IPAdd = '192.168.1.10'
$PrefLength = '24'
$DefGate = '192.168.1.1'
New-NetIPAddress -IPAddress $IPAdd -InterfaceAlias "Ethernet" -PrefixLength $PrefLength -DefaultGateway $DefGate

#Create IP routing table entry
New-NetRoute -DestinationPrefix 0.0.0.0/24 -InterfaceAlias "Ethernet"

#Change DNS Server
$NewDNS = '172.16.0.11'
 Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddress $NewDNS 
 Get-DnsClientServerAddress

 #Enable Firewall in Group Remote Access
 Enable-NetFirewallRule -DisplayGroup "Remote Access" | Set-NetFirewallRule -DisplayGroup "Remote Access" -Enabled True

 #Test Network Connection
 Test-Connection LON-DC1

 #View Network Configuration
 Get-NetIPConfiguration

 #Change Client IP Address
 $NewIPAdd = '172.16.0.40'
 $OldIPAdd = '172.16.0.50'
 New-NetIPAddress -InterfaceAlias Ethernet -IPAddress $NewIPAdd -PrefixLength 16
 Remove-NetIPAddress -InterfaceAlias Ethernet -IPAddress $OldIPAdd


 
