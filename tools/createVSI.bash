#/usr/bin/bash
#
# Get IAM token
#
echo "Retrieving IAM token..."
export iam_token=`ibmcloud iam oauth-tokens |cut -f 5 -d' '`
# Get user id to create vsi name, convert to lower case
export userName=`id -un`
export vsiName="${userName,,}"-scc-vsi
echo "Creating VSI named: $vsiName ..."
echo ""
#
#
# In command line below, not quoting around $vsiName to get it to properly epxand in the configuration data
#

# Create a virtual server instance
export outputfile="$HOME/curlVSI.output"

curlRC=$(curl -s --write-out "%{http_code}" --output $outputfile -X POST \
  "https://us-south.iaas.cloud.ibm.com/v1/instances?version=2023-08-24&generation=2" \
  -H "Authorization: Bearer $iam_token" \
  -H "Content-Type: application/json" \
  -H "accept: application/json" \
  -d '{
  "zone": {
    "name": "us-south-2"
  },
  "resource_group": {
    "id": "803825d084f54f43b7405b8cf8403c47"
  },
  "name": "'$vsiName'",
  "vpc": {
    "id": "r006-60e173ba-bdf9-48f8-8491-f9a5623d5d7d"
  },
  "user_data": "",
  "profile": {
    "name": "bx2-2x8"
  },
  "keys": [
    {
      "id": "r006-fba5d34f-c635-42ce-8889-0a193dc4f5a0"
    }
  ],
  "volume_attachments": [],
  "boot_volume_attachment": {
    "volume": {
      "name": "'$vsiName'",
      "capacity": 100,
      "profile": {
        "name": "general-purpose"
      }
    },
    "delete_volume_on_instance_delete": true
  },
  "metadata_service": {
    "enabled": false
  },
  "primary_network_interface": {
    "name": "eth0",
    "primary_ip": {
      "auto_delete": true
    },
    "allow_ip_spoofing": true,
    "subnet": {
      "id": "0727-4f6c34ce-0969-45a0-af4e-f4677cb1d56f"
    },
    "security_groups": [
      {
        "id": "r006-80d7d4e3-baa1-42a6-93cf-d9d9ad46fed3"
      }
    ]
  },
  "network_interfaces": [],
  "availability_policy": {
    "host_failure": "restart"
  },
  "image": {
    "id": "r006-907911a7-0ffe-467e-8821-3cc9a0d82a39"
  }
}') 


echo ""

if [ $curlRC -eq 201 -o $curlRC -eq 200 ] 
then
  echo "VSI successfully provisioned."
  echo "The name of your VSI is: $vsiName"
else
  echo "There was an error creating your VSI, error code: $curlRC"
  echo "Possible causes:"
  echo " - you have already created a VSI with the same name - you should only need one for the SCC L3"
  echo " - a temporary error has occurred - try running the command again"
  echo " - a more serious problem has occurred - contact the owner SCC L3: andrewj@us.ibm.com"
  echo "   with the following output:"
  echo ""
  cat $outputfile
fi
echo ""
echo ""
rm $outputfile

