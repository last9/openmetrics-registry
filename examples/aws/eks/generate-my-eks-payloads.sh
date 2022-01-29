#!/bin/bash

set -eou pipefail

aws cloudwatch list-metrics --namespace ContainerInsights > /var/tmp/containerinsights-metrics.json

jq '.Metrics[].Dimensions | from_entries' < /var/tmp/containerinsights-metrics.json | jq -s '.[] | select(.ClusterName!=null) | {ClusterName: .ClusterName}' | jq -s 'unique_by({ClusterName})' > my-eks-clusters.json

jq '.Metrics[].Dimensions | from_entries' < /var/tmp/containerinsights-metrics.json | jq -s '.[] | select(.PodName!=null) | {ClusterName: .ClusterName, PodName: .PodName, Namespace: .Namespace}' | jq -s 'unique_by({ClusterName,PodName,Namespace})' > my-eks-clusters-pods.json

jq '.Metrics[].Dimensions | from_entries' < /var/tmp/containerinsights-metrics.json | jq -s '.[] | select(.Service!=null) | {ClusterName: .ClusterName, Service: .Service, Namespace: .Namespace}' | jq -s 'unique_by({ClusterName,Service,Namespace})' > my-eks-clusters-services.json

jq '.Metrics[].Dimensions | from_entries' < /var/tmp/containerinsights-metrics.json | jq -s '.[] | select(.NodeName!=null) | {ClusterName: .ClusterName, NodeName: .NodeName, InstanceId: .InstanceId} ' | jq -s 'unique_by({ClusterName,NodeName,InstanceId})' > my-eks-clusters-nodes.json
