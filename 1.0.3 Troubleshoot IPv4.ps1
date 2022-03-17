
#Demonstration: Troubleshooting IPv4
#Task 1: Using Get-NetIPAddress and ipconfig
Get-NetIPAddress -InterfaceAlias “London_Network” 
ipconfig 

#Task 2: Using Test-NetConnection and ping
Test-NetConnection 172.16.0.1 
Ping 172.16.0.1 

#Using Test-NetConnection –TraceRoute and tracert
Test-NetConnection -TraceRoute 172.16.18.20 
Tracert 172.16.18.20 