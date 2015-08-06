# Quirkbot Linux Installer Script
A script that adds Quirkbot support to Linux by allowing user to access the serial ports and adding the correct udev rules.

## Publishing
In order to publish this script to Quirkbot's S3, run:
```
$ sh s3-publish.sh
```
The script will be available at http://code.quirkbot.com/install/linux/quirkbot.sh

## Installing
To install the script directly from the web, run (you will need to input your administrator password):
```
sudo sh <(curl -s http://code.quirkbot.com/install/linux/quirkbot.sh)
```
You will need to **log out** and then **log in** again in order for the changes to take effect.
