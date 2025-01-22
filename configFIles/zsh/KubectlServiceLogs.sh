#!/bin/bash

# Parse positional argument (workflow)
if [[ $# -ge 1 && "$1" != -* ]]; then
   Service=$1
   shift
fi

# Check if Service is empty
if [ -z "$Service" ]; then
      echo "Error: Service name is required"
      exit 1
fi

# Now parse options like -n
while getopts ":n:" option; do
   case $option in
      n) 
         nameSpace=$OPTARG;;
     \?)
         echo "Error: Invalid option"
         exit;;
   esac
done

podNames=$(kubectl get pods -n $nameSpace -l app=$Service -o jsonpath='{.items[*].metadata.name}')
podArray=($podNames)

# Iterate over the pod names
for podName in "${podArray[@]}"; do
  kubectl logs $podName -n $nameSpace
done
