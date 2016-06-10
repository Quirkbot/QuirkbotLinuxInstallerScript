# Quirkbot Linux Installer Script
Adds Quirkbot support to Linux by allowing user to access the serial ports and adding the correct udev rules.


## Building releases

You should build and test the release before deploying them:

- Install node dependencies:
```
npm install
```
- Update the version in `package.json`
- Run:
```
npm run gulp -- build
```

## Deploying Releases
To deploy to Amazon S3, please create the corresponding configuration
files in `/aws-config/[environment].json`.
For security, those files should not be included on the repository.

Examples:

#### `/aws-config/stage.json`

```
{
  "key": "YOUR_S3_KEY",
  "secret": "YOUR_S3_SECRET",
  "bucket": "code-stage.quirkbot.com",
  "region": "us-east-1"
}

```
#### `/aws-config/production.json`

```
{
  "key": "YOUR_S3_KEY",
  "secret": "YOUR_S3_SECRET",
  "bucket": "code.quirkbot.com",
  "region": "us-east-1"
}

```

Before deploying, please run the "Building Releases" instructions and make sure
everything works as desired. When you are ready to deploy:

- Update the version in `package.json`
- Run:
```
npm run gulp -- deploy --environment=stage
```
or
```
npm run gulp -- deploy --environment=production
```
The script will be available at 	
https://s3.amazonaws.com/quirkbot-downloads-production/downloads/quirkbot-linux-installer-latest.sh

--------------------------------------
# Installing
## Automatic script
To install directly from the web, copy and paste the following line in the terminal, then press ENTER:
```
wget -nv https://s3.amazonaws.com/quirkbot-downloads-production/downloads/quirkbot-linux-installer-latest.sh -O - | sh
```
The script will prompt you to add your administrator password.

You will need to **log out** and then **log in** again in order for the changes to take effect.

## Manual installation
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
