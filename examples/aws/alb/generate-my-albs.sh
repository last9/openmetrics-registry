#!/bin/bash

set -eou pipefail

aws elbv2 describe-load-balancers | \
jq -r '.LoadBalancers[].LoadBalancerArn | select(. | contains("loadbalancer/app"))' | \
xargs aws elbv2 describe-tags --resource-arns | jq '.TagDescriptions[] | select((.Tags[] | select(.Key=="kubernetes.io/ingress-name") | .Value) | match("staging-alb")) | .ResourceArn | {LoadBalancer: .}' | \
jq -s > "my-albs.json"

sed -i -E 's!arn:aws:.+:.+:.+:loadbalancer/!!g' my-albs.json
