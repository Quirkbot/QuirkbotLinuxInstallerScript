rm -r s3_publish
mkdir s3_publish

cp quirkbot-linux.sh s3_publish/quirkbot.sh

aws s3 sync s3_publish s3://code.quirkbot.com/install/linux --delete --exclude *.DS_Store
