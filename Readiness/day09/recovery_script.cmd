REM Load the hive
reg load HKLM\BROKENSYSTEM f:\windows\system32\config\SYSTEM

REM Enable Serial Console
bcdedit /store E:\boot\bcd /set {bootmgr} displaybootmenu yes
bcdedit /store E:\boot\bcd /set {bootmgr} timeout 10
bcdedit /store E:\boot\bcd /set {bootmgr} bootems yes
bcdedit /store E:\boot\bcd /ems {<BOOT LOADER IDENTIFIER>} ON
bcdedit /store E:\boot\bcd /emssettings EMSPORT:1 EMSBAUDRATE:115200

REM Get the current ControlSet from where the OS is booting
for /f "tokens=3" %x in ('REG QUERY HKLM\BROKENSYSTEM\Select /v Current') do set ControlSet=%x
set ControlSet=%ControlSet:~2,1%

REM Suggested configuration to enable OS Dump
set key=HKLM\BROKENSYSTEM\ControlSet00%ControlSet%\Control\CrashControl
REG ADD %key% /v CrashDumpEnabled /t REG_DWORD /d 1 /f
REG ADD %key% /v DumpFile /t REG_EXPAND_SZ /d "%SystemRoot%\MEMORY.DMP" /f
REG ADD %key% /v NMICrashDump /t REG_DWORD /d 1 /f

REM Unload the hive saving the changes
reg unload HKLM\BROKENSYSTEM



bcdedit /store E:\boot\bcd /set {bootmgr} device partition=E:
bcdedit /store E:\boot\bcd /set {bootmgr} integrityservices enable
bcdedit /store E:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} device partition=F:
bcdedit /store E:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} integrityservices enable
bcdedit /store E:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} recoveryenabled Off
bcdedit /store E:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} osdevice partition=F:
bcdedit /store E:\boot\bcd /set {f3d27cac-a8b4-11e4-92e8-dee7bc146ee5} bootstatuspolicy IgnoreAllFailures