Questions: 

Please answer how you fix all the systems and explain the causes 
general steps:
All vhds are gen1 windows images, attach them to the nested-hyper-v-enabled VM, and create a gen 1 hyper-v vm, use it as IDE0 disk
Test1.vhd: active boot partition
commands:
diskpart
sel disk 1
list part
sel part 1
detail part
active
exit

Test2.vhd: recreate the BCD store entirely
commands:
 
REM Prereq: run this and save the identifer string under Windows Boot Loader
bcdedit /store D:\boot\bcd /enum /v

REM Create a copy of the BuiltIn BCD template that comes within each windows installation. In this case as the OS is Gen 1, use the BIOS flag
bcdboot E:\windows /s D: /v /f BIOS
    
REM Re-add the following flags which are not going to be there by default
REM for instance, if your identifer is {default}, you would replace {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} with {default}
bcdedit /store D:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} integrityservices enable
bcdedit /store D:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} recoveryenabled Off
bcdedit /store D:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} bootstatuspolicy IgnoreAllFailures 
    
REM Renable EMS to enable the serial console feature
bcdedit /store D:\boot\bcd /set {bootmgr} displaybootmenu yes
bcdedit /store D:\boot\bcd /set {bootmgr} timeout 5
bcdedit /store D:\boot\bcd /set {bootmgr} bootems yes
bcdedit /store D:\boot\bcd /ems {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} on 
bcdedit /store D:\boot\bcd /emssettings EMSPORT:1 EMSBAUDRATE:115200

Test3.vhd: rebuild BCD entirely

Test4.vhd: rebuild BCD entirely

Test5.vhd: boot on last known good configuration

command:

  reg load HKLM\BROKENSYSTEM E:\windows\system32\config\SYSTEM

    $key = 'HKLM:\BROKENSYSTEM\Select'
    Set-ItemProperty -Path $key -name 'Current' -Value ((Get-ItemProperty -Path $key -name 'Current').Current+1) -Type Dword
    Set-ItemProperty -Path $key -name 'Default' -Value ((Get-ItemProperty -Path $key -name 'Default').Default+1) -Type Dword
    Set-ItemProperty -Path $key -name 'Failed' -Value ((Get-ItemProperty -Path $key -name 'Failed').Failed+1) -Type Dword
    Set-ItemProperty -Path $key -name 'LastKnownGood' -Value ((Get-ItemProperty -Path $key -name 'LastKnownGood').LastKnownGood+1) -Type Dword

    reg unload HKLM\BROKENSYSTEM

Test6.vhd: boot on last known good configuration

Test7.vhd:
rebuild BCD show file corruption
command:

sfc /scanfile=E:\windows\system32\drivers\partmgr.sys /offwindir=E:\windows /offbootdir=D:\ /OFFLOGFILE=c:\log.txt
