Questions: 

1.       How can we deploy an VM having the Nested Hyper-V available? 
there are many requirements when creating the VM:
  - Select a series that supports nested virtualization, such as Dv3 or Dv4.
  - Change the security type to Standard.
If it's used as a Rescue VM, we need also:
  - Select same location, Storage Account and Resource group as the faulty VM.
  - Select the same storage type as the faulty VM (Standard or Premium).
 
If not selected the standard security type, we can also change it later in the VM:
  - run the cmdlet:
     bcdedit /set hypervisorlaunchtype auto
    Restart-Computer -Force
Then we need add a Hyper-V role in Server manager to install Hyper-V feature in the VM.
