Planned maintenance & Scheduled events
 
Questions: 

1.       How many kinds of maintenance are there? What are they? 
automatic OS image upgrade, automatic VM guest patching, automatic extension upgrade and hot patch.
2.       What is the schedule event? 
Scheduled Events is an Azure metadata service that gives your application time to prepare for virtual machine maintenance. It provides information about upcoming maintenance events so that your application can prepare for them and limit disruption.

VM Reboot
Questions: 

1.       What could be the causes of the VM reboot? 
Platform/Host Initialized:
 - By Fabric due to any platform Workflow timeouts.
 - By Fabric due to Node being unresponsive/unavailable for more than 10 minutes.
 - By Fabric due to Node not in Goal state for a long time (if the Host Agent is responding fine then the Goal State is healthy).
 - Due to Host OS BSOD/BugCheck.
 - Due to Hardware issues.
 - Host Node might go into Human Investigate state due to some faults detected by Fabric, and the VM service healed to a different Host Node.
Guest OS Initiated:
 - Guest VM rebooted/stopped or redeployed by customer from CRP/RDFE.
 - Guest VM rebooted by Host Agent due to Event 17 (that gets raised when there is a connectivity issue between the Host and Storage in 2 mins).
 - Guest VM rebooted by disk performance or surprising removed.
 - Guest VM rebooted by BSOD/BugCheck (Hyper-V 18590 event) (for Windows VMs) or kernel panic (for linux VMs).
 - (Windows) Guest VM rebooted by Windows Updates.
 - (Windows) Guest VM rebooted by any service / customer operation.
 - Guest VM rebooted by Triple Fault (Hyper-V 18560/18590 events).
 
2.       What is the workload while working on the VM reboot RCA case? 
Information Collection, Data Collection, LSI Check, if find patterns follow LSI/SIE playbook process, if not Check Azure Support center 
3.       Which internal tools can be leveraged to troubleshoot the VM reboot RCA case? 
Host Analyzer, InspectIaasDisk, WinGuest Anylyzer for Windows, Console Log for Linux

Boot Diagnostic
Questions: 

1.       What is the perquisite for the boot diagnostic? 
 - Managed boot diagnostics is only available for Azure Resource Manager VMs.
 - Managed boot diagnostics doesn't support VMs using unmanaged OS disks.
 - Boot diagnostics doesn't support premium storage accounts or zone redundant storage accounts.
 - Portal only supports the use of boot diagnostics with a managed storage account for single instance VMs.
2.       What is the boot diagnostic mainly used for? 
It enables user to observe the state of their VM as it is booting up by collecting serial log information and screenshots and allows diagnosis of VM boot failures.
