#Begin script
Write-Output "Starting Script"

#Install and configure DHCP
Add-WindowsFeature DHCP
Add-WindowsFeature RSAT-DHCP
Add-DhcpServerInDC

#Install and configure DNS
Add-WindowsFeature DNS
Add-WindowsFeature RSAT-DNS-Server
Add-DnsServerPrimaryZone -Name "contoso.com" -ZoneFile "contoso.com"
Add-DnsServerResourceRecordA -Name "www" -ZoneName "contoso.com" -IPv4Address 172.16.0.11
Add-DnsServerResourceRecordA -Name "mail" -ZoneName "contoso.com" -IPv4Address 172.16.0.12
Write-Output "Script Complete"

#Install IPAM (IP Address Management) Server
Install-WindowsFeature IPAM -IncludeManagementTools

#Provision IPAM
$Domain = "LON-SVR2.Adtum.com"
$GPO = "IPAM" 
Invoke-IpamGpoProvisioning -Domain $Domain -GpoPrefixName $GPO -Force
#or
Invoke-IpamGpoProvisioning -Domain Adatum.com -DomainController lon-dc1.adatum.com -GpoPrefixName IPAM -IpamServerFqdn LON-SVR2.adatum.com -DelegatedGpoUser Administrator

#Perform IPAM Server Discovery on Adatum.com
Add-IpamDiscoveryDomain -Name "Adatum.com" -DiscoverDc $False -PassThru

