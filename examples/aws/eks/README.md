### Introduction

EKS uses [ContainerInsights](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-setup-EKS-quickstart.html) to capture
K8s metrics in Cloudwatch.

ContainerInsights exposes metrics of the following entities:

1. Cluster
2. Pod
3. Service
4. Node

The sample script [./generate-my-eks-payloads.sh](./generate-my-eks-payloads.sh) how easy it is to generate
payloads for capturing metrics of the above components.


### Steps

1. Modify `./generate-my-eks-payloads.sh` for adding any filters if required and run

  ```
  ./generate-my-eks-payloads.sh
  ```

2. Generate and show output metrics in debuggable format

  ```
  /tmp/iox-agent plan --dir .
  ```

3. Emit metrics on `http://localhost:9100/metrics`

  ```
  /tmp/iox-agent run openmetrics --dir .
  ```
