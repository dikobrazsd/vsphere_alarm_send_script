#!/bin/bash

ENV_VARIABLES_JSON=$(env | grep "^VMWARE_ALARM_" | awk -F= '$1 != "VMWARE_ALARM_DECLARINGSUMMARY" && $2 {print $1"="$2}' | jq -Rs 'split("\n")[:-1] | map(split("=")) | map({(.[0]): .[1]}) | add')

if [ -z "$ENV_VARIABLES_JSON" ]; then
 exit
fi

if [ "$ENV_VARIABLES_JSON" == "null" ]; then
 exit
fi

curl -k -X POST "..../api/esxi/collect" -H "Content-Type: application/json" -H 'Auth:....' --data "$ENV_VARIABLES_JSON"
