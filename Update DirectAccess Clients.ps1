#Update DirectAccess clients
gpupdate

#Display Name Resolution Policy Table (NRPT) entries for DirectAccess
Get-DnsClientNrptPolicy

#Display network connectivity status indicator settings
Get-NCSIPolicyConfiguration 

#Check if client can reach the network location server URL (ConnectedLocally)
Get-DAConnectionStatus