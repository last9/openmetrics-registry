#!/bin/bash

set -eou pipefail

aws rds describe-db-instances | \
jq '.DBInstances[] | select((.TagList[] | select(.Key=="Name") | .Value) | match("last9")) | .DBInstanceIdentifier | {DBInstanceIdentifier: .}' | \
jq -s > "my-rds.json"
