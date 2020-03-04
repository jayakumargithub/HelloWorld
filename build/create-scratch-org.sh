# Get the private key from the environment variable
echo "Setting up DevHub Connection..."
mkdir keys
echo $SFDC_SERVER_KEY | base64 -d > keys/server.key

# Authenticate to salesforce
echo "Authenticating..."
sfdx force:auth:jwt:grant --clientid 3MVG9xB_D1giir9o89Jg3P4layswT.MbgcqIjAfaBSDbdjI7GNf0TkXfnOEbknSo9Sq5Gt4ySS3FIwZAzTyxC --jwtkeyfile keys/server.key --username vickyarthur74@gmail.com --setdefaultdevhubusername -a DevHub

#Create a scratch org
echo "Creating the Scratch Org..."
sfdx force:org:create -f config/project-scratch-def.json -a ${CIRCLE_BRANCH} -s