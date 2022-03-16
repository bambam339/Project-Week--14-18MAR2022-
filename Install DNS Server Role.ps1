#Install DNS Server Role
Install-WindowsFeature DNS -IncludeManagementTools

#Configure DNS Forwarding
$IPAddress = 131.170.0.100
Add-DnsServerForwarder -IPAddress $IpAddress

#Check for current forwarders
Get-DnsServerForwarder

#Remove DNS Forwarder
$IPAddress = '131.170.0.100'
Remove-DnsServerForwarder -IPAddress $IPAddress

#Configure DNS Conditional Forwarding
$ZoneName = "Adatum.com"
$ForwarderAdd = '172.16.0.10'
Add-DnsServerConditionalForwarderZone -Name $ZoneName -MasterServers $ForwarderAdd 

#Check Current Zones
Get-DnsServerZone 

#Remove Conditional Forwarder
$ZoneName = "Adatum.com"
Remove-DnsServerZone -Name NameOfZoneHere

