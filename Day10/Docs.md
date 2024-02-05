Questions:

1.       What is Cloud Shell and how can we access it? 
Azure Cloud Shell is an interactive, authenticated, browser-accessible terminal for managing Azure resources. It can be accessed from azure portal via the terminal icon, or in shell.azure.com, azure cli documentation, Azure PowerShell documentation, Azure mobile app, and Visual Studio Code Azure account extension.
2.       In which scenario do you think we have to swap the OS disk? 
fixing boot problems


Questions: 

1.       What is the single user mode and what we can do over the single user mode? 
Single-user mode is a minimal environment with minimal functionality.
It can be useful for investigating boot issues, file system issues, or network issues. It is also useful in situations where your VM might be configured to accept only SSH key for sign-in.
2.       What is the main reason of why file system issue could finally cause the VM starting issue? 
disk corruption.
3.       When the kernel related boot issue could be happening? 
 
 - recent kernel upgrade/downgrade
 - kernel module changes
 - OS recent configuration changes

file system related:
- initramfs was not generated
 - missing important files and directories
 - missing important system core libraries and packages
 - wrong file permissions
 - missing partitons
 - SELinux issues
