Questions
 
1.       What is the difference between managed disk and unmanaged disk? 
Managed disks are managed by Microsoft Azure, don't require storage account when create it, but user don't have full control. Unmanaged disks requires a storage account to create it, but user have full control of the data on it.
2.       What are the benefits when the customers are using managed disks? 
Simple - no storage account required, secure by default - encryption by default, better performance with premium disks
3.       What is the default drive of temp drive in Azure VM? 
Drive D for Windows VM, /dev/sdb1 for Linux VM
4.       If we restart the OS inside the Guest OS side, will data saved on temp drive get lost? Why? 
Maybe. data stored on temporary disk is subjected to lost at any time, such as hardware failures that cause Azure to move the VM to another node.
5.       How can we create a snapshot for a disk and how to restore the disk from it? 
Create: select "Create snapshot" from disk menu
6.       What is the main procedure of creating a Linux data disk. 
Create disk, attach to LinuxVM, then format and mount it.