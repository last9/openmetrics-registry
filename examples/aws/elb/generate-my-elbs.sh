#!/bin/bash

set -eou pipefail

aws elb describe-load-balancers | \
jq -r '.LoadBalancerDescriptions[].LoadBalancerName' | \
xargs aws elb describe-tags --load-balancer-names | jq '.TagDescriptions[] | select((.Tags[] | select(.Key=="webserver") | .Value) | match("true")) | .LoadBalancerName| {LoadBalancerName: .}' | \
jq -s > "my-elbs.json"
