Azure VM agent/extension
lab1 Reinstall the VM agent of a Windows VM
steps: in control panel-programs-programs and features, select Windows Azure VM Agent to uninstall it
download Azure VM agent from https://github.com/Azure/WindowsVMAgent and install it
Azure VM agent/extension
lab1 Reinstall the VM agent of a Windows VM
steps: in control panel-programs-programs and features, select Windows Azure VM Agent to uninstall it
download Azure VM agent from https://github.com/Azure/WindowsVMAgent and install it


Questions: 
 

1.       What is the agent used for the VM? 
It is a process that manages VM interaction with the Azure fabric controller. On Linux VMs, it also manages VM provisioning.
2.       What is the extension? 
Extensions are small applications that provide post-deployment configuration and automation on Azure VMs.
3.       How can we check the extension and agent status? 
agent status: VM overview-properties-agent status
extension: VM settings - extensions + applications

4.       Can we install an extension while the VM agent is not running? Why? 
No. the extensions are installed by VM agent into VM.
5.       What is IP address 168.63.129.16? 
It is a virtual public IP address that serving as a gateway to Azure platform, such as DNS/DHCP, health report/heartbeat and VM agent. It is consistent across all Azure regions.
 

Virtual machine scale set
Lab1 create a VMSS and configure auto scale for it

Questions: 
1.       Why do we need to use the VMSS? 
VMSS offers the ability to automatically scale as resource demand changes. Also, it provides consistent configurations, high availability, and can run at large scale.
2.       What if the customer needs to upgrade the image of the VMSS, how do they achieve that? 
Use OS Image Upgrade for a non-disruptive way, or use reimage to immediate change the running VM.
