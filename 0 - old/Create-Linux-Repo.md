## Create your own debian packages and host your own linux repo!

### Creating your debian package

This is an example! <br/>
Please change the email adress and vars and also the links!

#### creating new folder for your own deb package

```shell
mkdir -p nezuko/DEBIAN
mkdir -p nezuko/usr/bin/
vi nezuko/DEBIAN/control
```

#### sample control file (control):

```markdown
Package: nezuko
Version: 0.0.1
Section: custom
Priority: optional
Architecture: all
Essential: no
Installed-Size: 1024
Maintainer: phoenixthrush.com
Description: does something nice
```

copy your executable files to nezuko/usr/bin (don´t forget to chmod it with +x)

#### building the deb file

```shell
dpkg-deb --build nezuko
```

now rename your nezuko.deb to something like nezuko_0.0.1-1_all.deb

### Create new repo

now run that command to install gpg and dpkg-dev:
```shell
sudo apt install gnupg dpkg-dev -y
```

create a folder and cd into it and copy your deb files to that dir!

```shell
EMAIL="contact@phoenixthrush.com"

sudo apt install gnupg
gpg --full-gen-key
gpg --export-secret-keys "${EMAIL}" > my-private-key.asc
gpg --import my-private-key.asc
gpg --armor --export "${EMAIL}" > ./ultrasecretcert.gpg

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release

gpg --default-key "${EMAIL}" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease

echo "deb [signed-by=/usr/share/keyrings/phoenixthrush-archive-keyring.gpg] https://phoenixthrush.com/repo/stable ./" > phoenixthrush-packages.list 
```

### Add new packages

```shell
EMAIL="contact@phoenixthrush.com"

dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release

gpg --default-key "${EMAIL}" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease
```

### Give that commands to your friends

remember that you used your own email and change phoenixthrush.com to your hosting url! <br>
also backup your private key and move it to another location!

```shell
sudo curl -sSL https://phoenixthrush.com/repo/stable/ultrasecretcert.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/phoenixthrush-archive-keyring.gpg >/dev/null 2>&1
sudo curl -sSL --compressed -o /etc/apt/sources.list.d/phoenixthrush-packages.list "https://phoenixthrush.com/repo/stable/phoenixthrush-packages.list" >/dev/null 2>&1
sudo apt update >/dev/null 2>&1
```

### That are just basics, you can modify more things, like including an uninstall script!

search for more debian configs like (preinst, postinst, prerm, postrm files). <br/>
you would need to create an executable file inside the DEBIAN folder and name it like one of the above for example prerm for an uninstall script. <br/>
after that chmod it with 775 and +x.

thats it! <br/>
contact me at [contact@phoenixthrush.com](mailto:contact@phoenixthrush.com) if you have questions and have fun creating your own repo!
