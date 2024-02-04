Question1   Can you change the VNET of an existing VM? If a customer wants to move an existing VM to another VNET, what suggestion would you offer? 
No. I suggest stop and destroy the VM, but keep OS disk. Then redeploy it using existing OS disk and new VNET.

Question1 What is NSG used for?
NSG (network security group) is used for filtering network traffic between Azure resources in an Azure virtual network.

 
Questions: 

1.       How many storage account services are there? 
there are 5 non-preview services: Azure Blobs, Azure Files, Azure Queues, Azure Tables and Azure managed Disks. 2 preview services: Azure Elastic SAN and Azure Container Storage

2.       How many storage redundancy type are there and what are they used for? 
Locally redundant storage (LRS), Zone-redundant storage (ZRS), Geo-redundant storage (GRS), Geo-zone-redundant storage (GZRS)
LRS: lowest-cost redundancy option, replicates storage account three times within a single data center in the primary region
ZRS: copies data synchronously across three Azure availability zones in the primary region
GRS: LRS with a LRS in the secondary region
GZRS: ZRS with a LRS in the secondary region
these options provide different levels of durability. for outage scenario of node unavailable, LRS is enough. But with Data Center outages, ZRS ensures data availability. For region-wide outage, the GRS/GZRS can ensure data access. the main difference of them is that GZRS provides availability zones advantages in the primary region, so with data center outages, customers didn't need to switch region.
3.       What are the differences between SAS and access key? 
both provides access to resources in storage account, but SAS provides granular control over data access, such as resource/permission/duration. The SAS was secured with Microsoft Entra or storage account key, so it's more secure; the account key was more easily compromised.
4.       Storage account data protection 
Azure Resource manager lock can prevent storage account from being deleted/modified; Immutability policy on a blob version can prevent a blob version from being deleted for specified interval; Immutability policy on a container can prevent the container and its blobs from being deleted for specified interval; Container soft delete enables restoration for a deleted container within specified interval; Blob soft delete enables restoration for a deleted blob within specified interval; manually saving a Blob snapshot provides restoration of specified blob data, whereas Blob versioning automatically save as a snapshot for each blob write; Point-in-time restore provides snapshot for a set of block blobs. For more complicated scenario, customer can roll own solution for copying data to a second account using related tools, such as AzCopy.