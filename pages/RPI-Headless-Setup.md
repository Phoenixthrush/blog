## How to setup your raspberry pi without a monitor?

### Windows

- install the [Raspberry Pi Imager](https://www.raspberrypi.com/software/tool) tool
- burn the raspbian image on your raspberry´s sd card
- unplug the sd card and replug it
- open up explorer and click on view on the option menue and tick the "File name extensions" box
- now create a new text document and call it ssh (also remove the ".txt" file extension)
- now create a second file and call it wpa_supplicant.conf if you need wifi

wpa_supplicant.conf file:

```markdown
country=DE
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
scan_ssid=1
ssid="your_wifi_ssid"
psk="your_wifi_password"
}
```

### Linux 

install the rpi-imager for your linux distro

#### for debian based distros enter:

```shell
sudo apt install rpi-imager
```

#### for arch based distros via snap

if you don´t have snap installed run that commands:

```shell
sudo pacman -S snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```

if you have snap run that:

```shell
sudo snap install rpi-imager
```

#### creating files to enable ssh and connecting to a wifi
now cd into your sd card and enable ssh:

```shell
touch ssh
```

and create the wpa_supplicant.conf file if you need wifi

```shell
cat <<EOF > wpa_supplicant.conf
country=DE
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
scan_ssid=1
ssid="your_wifi_ssid"
psk="your_wifi_password"
}
EOF
```

### MacOS

- install the [Raspberry Pi Imager](https://github.com/raspberrypi/rpi-imager/releases) tool
- burn the raspbian image on your raspberry´s sd card
- unplug the sd card and replug it

now cd into your sd card and enable ssh:

```shell
touch ssh
```

and create the wpa_supplicant.conf file if you need wifi

```shell
cat <<EOF > wpa_supplicant.conf
country=DE
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
scan_ssid=1
ssid="your_wifi_ssid"
psk="your_wifi_password"
}
EOF
```

### Thats it, wasn´t it easy lmao?

Contact me at [contact@phoenixthrush.com](mailto:contact@phoenixthrush.com) if you have questions!
