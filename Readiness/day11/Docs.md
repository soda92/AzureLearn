Questions: 
What is the serial console used for? 
Serial console in the azure portal provides access to text-based console for VMs and VMSS instances. It connects to the ttyS0 or COM1 port, providing access independent of the network or operating system state.
What could be the common causes when the serial console doesn't work properly? 
Your VM is not started
Your VM didn't have boot diagnostics enabled
Your account that uses serial console didn't have the VM contributor role for VM or the boot diagnostics account
 Your VM/VMSS didn't have a password-based user
For Linux VMs, it must be configured for serial output on ttyS0.

Questions:
What would be the correct practices for the Azure VM to set up the static private IP address?
In Virtual machine->settings->networking, select NIC, in NIC settings, select IP configurations, select ipconfig<number>, set assignment type to static, then set desired ip address, and save it.
If the VM is inaccessible over Remote Desktop, what would be the ways to connect to the VM to perform the mitigation steps?
If enabled Boot diagnostics, connect VM via serial console and check configuration and firewall settings
If agent was ready, use "VM password reset" extension to reset RDP configuration
If the agent is not running properly or not installed, what would be the way to fix the RDP related issue?
power off the VM, create a snapshot of the OS disk, then create a copy of the disk from snapshot, attach it to a rescue VM, fix the problems, and swap the OS disk back

