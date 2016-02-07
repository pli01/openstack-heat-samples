# Set with your own tenant values
export OS_USERNAME=""
export OS_TENANT_NAME=""
export OS_TENANT_ID=""
export OS_PASSWORD=""

export OS_REGION_NAME="fr1"
export OS_AUTH_URL="https://identity.fr1.cloudwatt.com/v2.0"

export FACTORY_NETWORK_ID=$network_id
export FACTORY_SECURITY_GROUP_ID=$security_group_id

if [ ! -z "$OS_USERNAME" -a ! -z "$OS_PASSWORD" ]; then
   if [ ! -z "$OS_TENANT_NAME" -a ! -z "$OS_TENANT_ID" ]; then
      export FACTORY_SECURITY_GROUP_NAME="$(neutron security-group-show $FACTORY_SECURITY_GROUP_ID | grep name | cut -d"|" -f3 | tr -d " ")"
   fi
fi
