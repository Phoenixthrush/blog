## How to install the windows subsystem for linux (WSL)?

### Enabling WSL feature

There are two easy ways to enable it (graphical and via an powershell prompt).

#### First method graphical (via the optional features menue):

- Press the Windows button and the R key at the same time
- Enter "optionalfeatures" and press enter again
- Now scroll down and tick the "Windows Subsystem for Linux"
- You need to reboot after it

That´s it!

#### Second method via an powershell prompt):

- Open up an powershell prompt with admin rights
- Enter that command:
```ps
Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online
```
- Reboot after it

That´s it!

### Installing Debian on WSL

- open up an admin prompt and enter that commands to install debian <br/>
- it will ask you for a UNIX name, just insert your username or anything you want lmao <br/>
- insert the password you want and confirm it <br/>
- and yeah it will be blank if you type

```cmd
wsl --install -d Debian
```

### Thats it, wasn´t it easy lmao?

Uhm contact me at [contact@phoenixthrush.com](mailto:contact@phoenixthrush.com) if you have questions! <br/>
Have fun using linux on your windows workstation!
