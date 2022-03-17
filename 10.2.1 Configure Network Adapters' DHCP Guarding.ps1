#Networking with Windows Server 2016
#Module 10: Configuring advanced networking features
#Exercise 2: Configuring and using the advanced features of a virtual switch

#Task 1: Configure the network adapters to use DHCP guarding in 20741B-LON-SVR1-B & 20741B-LON-CL1-B.
Set-VMNetworkAdapter -VMName 20741B-LON-DC1-B -DhcpGuard On
Set-VMNetworkAdapter -VMName 20741B-LON-CL1-B -DhcpGuard On 

#Task 2: Configure and use DHCP guard in LON-CL1

#Take note LON-CL1's TCP/IP settings
Get-NetIPConfiguration

#Result
InterfaceAlias: Ethernet
IP Address: 172.16.0.50
Subnet Mask: 255.255.255.0
Default Gateway: 172.16.0.1
Preferred DNS Server: 172.16.0.10

# Return network interface to a variable for future use
$interface = Get-NetIPInterface -InterfaceAlias "Ethernet" -AddressFamily IPv4

# Remove the static default gateway
$interface | Remove-NetRoute -AddressFamily IPv4 -Confirm:$false

# Set interface to "Obtain an IP address automatically"
$interface | Set-NetIPInterface -Dhcp Enabled

# Set interface to "Obtain DNS server address automatically"
$interface | Set-DnsClientServerAddress -ResetServerAddresses

#Install DHCP Server Role in LON-SVR1
Install-WindowsFeature DHCP -IncludeManagementTools

#Create New Scope
$ScopeName = "Lab 10 Scope"
$StartIP = '172.16.0.200'
$EndIP = '172.16.0.210'
$Subnet = '255.255.0.0'
$Router = '172.16.0.1'
Add-DhcpServerv4Scope -Name $scopeName -StartRange $StartIP -EndRange $EndIP -SubnetMask $Subnet
Set-DhcpServerv4OptionValue -Router $Router

#Prevent LON-DC1 from issuing a DHCP lease
Set-VMNetworkAdapter -VMName 20741B-LON-DC1-B -DhcpGuard On
Set-VMNetworkAdapter -VMName 20741B-LON-SVR1-B -DhcpGuard Off 

#On LON-CL1 CMD prompt
IPConfig /release 
IPConfig/renew 

#Task 3: Configure and use VLANs

#Remove NIC Team in LON-SVR1
Remove-NetLbfoTeam -Name LON-SVR1 NIC Team

#(FYI)Enable Virtual LAN Identification for management operating system and set to 2
Set-VMNetworkAdapterVlan -ManagementOS -Access -VlanId 2

#Task 4: Configure and use bandwidth management in Host
#Set Maximum Bandwidth
Set-VMNetworkAdapter -VMName 20741B-LON-SVR1-B -MaximumBandwidth 100

#Check Adapter Name in LON-SVR1-B

#Open Task Manager and Internet Explorer in SVR1 and compare Max Bandwidth
taskmgr

$IE=new-object -com internetexplorer.application
$IE.navigate2("www.microsoft.com")
$IE.visible=$true

