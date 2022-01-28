#!/bin/bash

set -eou pipefail

aws ec2 describe-instances --filter "Name=tag:service,Values=github-actions-runner" \
--query "Reservations[*].Instances[*].InstanceId"  --output json |\
jq -r '.[][] | {InstanceId: .}' | jq -s > my-ec2.json
