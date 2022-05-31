# for debian based distros

## updating the package list and installing the "unattended-upgrades" package

sudo apt update
sudo apt install unattended-upgrades apt-listchanges -y

## enabling and starting the service

sudo systemctl enable unattended-upgrades
sudo systemctl start unattended-upgrades

## modifying the config file

sudo cat << EOF > /etc/apt/apt.conf.d/50unattended-upgrades
Unattended-Upgrade::Origins-Pattern {
    "origin=Debian,codename=${distro_codename},label=Debian-Security";
    "origin=TorProject";
};
Unattended-Upgrade::Package-Blacklist {
};
EOF

## [optional] enabling automatic reboot

sudo cat << EOF >> /etc/apt/apt.conf.d/50unattended-upgrades
Unattended-Upgrade::Automatic-Reboot "true";
EOF

## modifying a second config file

sudo cat << EOF >> /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::AutocleanInterval "5";
APT::Periodic::Unattended-Upgrade "1";
APT::Periodic::Verbose "1";
EOF

## testing

sudo unattended-upgrade -d

## for arch based distros

## creating a autoupdate service

sudo cat << EOF >> /etc/systemd/system/autoupdate.service
[Unit]
 Description=Automatic Update
 After=network-online.target 

[Service]
 Type=simple
 ExecStart=/usr/bin/pacman -Syuq --noconfirm --needed --noprogressbar 
 TimeoutStopSec=180
 KillMode=process
 KillSignal=SIGINT

[Install]
 WantedBy=multi-user.target
EOF

## creating a timer that calls the autoupdate service

sudo cat << EOF >> /etc/systemd/system/autoupdate.timer
[Unit]
 Description=Automatic Update when booted up after 5 minutes then check the system for updates every 60 minutes

[Timer]
 OnBootSec=5min
 OnUnitActiveSec=60min
 Unit=autoupdate.service

[Install]
 WantedBy=multi-user.target
EOF

## enabling the autoupdate timer service

sudo systemctl enable --now autoupdate.timer
