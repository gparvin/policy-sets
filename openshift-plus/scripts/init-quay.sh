#!/bin/sh

QUAYHOST=$(oc get route -n local-quay registry-quay -o jsonpath='{.spec.host}')
RESULT=$(curl -X POST -k -s https://$QUAYHOST/api/v1/user/initialize --header 'Content-Type: application/json' --data '{ "username": "quayadmin", "password":"quaypass123", "email": "quayadmin@example.com", "access_token": true}')
if [ $? -eq 0 ]; then
	TOKEN=$(echo "$RESULT" | jq .access_token | sed s'/"//g')
	echo "Quay password successfully set for user quayadmin."
else
	echo "Quay user configuration failed"
fi
