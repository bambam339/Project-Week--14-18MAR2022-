#show the File Server and DFS components
get-windowsfeatures -name fs

#Install the DFS Replication role service
Install-WindowsFeature -Name FS-DFS-Namespace,FS-DFS-Replication –IncludeManagementTools

#Create a new namespace (domain-based namespace on LON-SVR1 named Research)
$Server = LON-SVR1
$Path = "\\Adatum.com\BranchDocs"
$Name = BranchDocs
New-DfsnRoot -TargetPath $Path -Asjob -Type DomainV2

#Create a new folder and folder target
New-DfsnFolder -Path "\\Contoso\AccountingResources\LegacySoftware" -TargetPath "\\Contoso-FS\AccountingLegacy" -EnableTargetFailback $True -Description "Folder for legacy software."

#Install DFS Replication Module
Install-Module DFSR

#Create a new folder target for replication
New-DfsReplicatedFolder -GroupName "RG22" -FolderName "RF26"


GroupName              : RG22
FolderName             : RF26
DomainName             : corp.contoso.com
Identifier             : 434ca205-388d-4f24-a5b0-7ff875d433e0
Description            :
FileNameToExclude      : {~*, *.bak, *.tmp}
DirectoryNameToExclude : {}
DfsnPath               :
IsDfsnPathPublished    : False
State                  : Normal

#Create a new replication group
New-DfsReplicationGroup -GroupName "RG01"

GroupName              : RG01
DomainName             : corp.contoso.com
Identifier             : 81251362-e30f-4c1e-b6b0-23906c1ebdd7
Description            : 
State                  : Normal