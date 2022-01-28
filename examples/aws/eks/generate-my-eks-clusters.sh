#!/bin/bash

set -eou pipefail

aws eks describe-cluster --name staging | jq -r '.cluster.name | {ClusterName: . }' | jq -s > ./my-eks-clusters.json
