#!/bin/bash

set -eou pipefail

aws elbv2 describe-load-balancers | \
jq -r '.LoadBalancers[].LoadBalancerArn | select(. | contains("loadbalancer/net/"))' | \
xargs aws elbv2 describe-tags --resource-arns | jq '.TagDescriptions[] | select((.Tags[] | select(.Key=="service.k8s.aws/resource") | .Value) | match("LoadBalancer")) | .ResourceArn | {LoadBalancer: .}' | \
jq -s > "my-nlbs.json"

sed -i -E 's!arn:aws:.+:.+:.+:loadbalancer/!!g' my-nlbs.json
