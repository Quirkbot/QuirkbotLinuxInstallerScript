# Quirkbot Linux Installer Script
Adds Quirkbot support to Linux by allowing user to access the serial ports and adding the correct udev rules.

# Publishing
In order to publish this script to Quirkbot's S3, run:
```
sh s3-publish.sh
```
The script will be available at http://code.quirkbot.com/install/linux/quirkbot.sh

# Installing
## Automatic script
To install directly from the web, copy and paste the following line in the terminal, then press ENTER:
```
wget -nv http://code.quirkbot.com/install/linux/quirkbot.sh -O - | sh
```
The script will prompt you to add your administrator password.

You will need to **log out** and then **log in** again in order for the changes to take effect.

## Manuall installation
If for some reason you don't want to run the script directly from the web, no worries, you can run the commands manually.

 Make sure to add your administrator password when requested.
#### 01. Allow user to access serial ports
Copy and paste the following line in the terminal, then press ENTER:
```
sudo gpasswd -a `whoami` $(ls -l /dev/* | grep /dev/ttyS0 |awk '{print $4}');

```
You will need to **log out** and then **log in** again in order for the changes to take effect.
#### 02. Add correct udev rules
Make sure to add your administrator password when requested.
```
echo "ATTRS{product}==\"Quirkbot*\", ENV{ID_MM_DEVICE_IGNORE}=\"1\"" \
| sudo tee /etc/udev/rules.d/99-quirkbot.rules; sudo udevadm control --reload-rules;
```
