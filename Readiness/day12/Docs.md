# Questions:

## 1. What could be the causes that make the SSH connectivity failure?

SELinux misconfiguration, in the file `/etc/selinux/config`, key `SELINUXTYPE` should be either targeted, minimum, mls

ssh config (`$HOME/.ssh`) configuration error, the right permission: `.ssh` 700, public key file 644, private key file 600, `known_hosts` 644.

NSG not allow ssh port, check nsg config port and sshd port

sshd service not running, check via serial console

password/key incorrect, use azure portal "reset password" to reset password/key

sshd configuration error, use azure portal "reset password" to reset configuration

unknown software/hardware error, try restart/redeploy VM

## 2. What are the quick steps that we can try when working on the SSH connectivity issue?
  restart/redeploy VM

  check NSG allowed port

  reset password via portal

  check .ssh folder permissions via serial console, if serial console not available, copy disk and attach 
  to rescue VM, mount partitions, and chroot into it

  check SELinux configuration


## 3. How to check which port SSH is running on?
/etc/ssh/sshd_config, grep Port


## 4. How to check whether the SSH is running?
use command:

`ps -C sshd`

`systemctl status ssh`
