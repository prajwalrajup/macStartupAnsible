#!/bin/bash

# Parse positional argument (workflow)
if [[ $# -ge 1 && "$1" != -* ]]; then
   Service=$1
   shift
fi

# Now parse options like -n
while getopts ":n:" option; do
   case $option in
      n) 
         Namespace=$OPTARG;;
     \?)
         echo "Error: Invalid option"
         exit;;
   esac
done

POD_NAMES=$(kubectl get pods -n $Namespace -l app=$Service -o jsonpath='{.items[*].metadata.name}')
POD_ARRAY=($POD_NAMES)

# Iterate over the pod names
for POD_NAME in "${POD_ARRAY[@]}"; do
  kubectl logs $POD_NAME -n $Namespace
done
