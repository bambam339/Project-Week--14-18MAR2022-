#Renew DHCP Lease
ipconfig /renew

#renew the lease on a specific connection
ipconfig /renew "Wireless Network Connection 4"

#renew the lease on a remote computer
$ComputerName = "LON-DC1"
GetWmiObject Win32_NetworkAdapterConfiguration –Computer $ComputerName

#Renew a Specific Adapter
$ComputerName = "LON-DC1"
$description = "Linksys WirelessG USB"
$adapter = GetWmiObject Win32_NetworkAdapterConfiguration –Computer $ComputerName |
WhereObject { $_.Description –match $description}
$adapter.RenewDHCPLease()

#Check Ipconﬁg on the remote computer
InvokeRemoteExpression \\$ComputerName { ipconfig /renew 