# Openmetrics-registry
Modules to be used by Openmetrics-exporter.

## What are Opemetrics-exporter modules?
Openmetrics-exporter modules are the reusable building blocks that scrape the information for standard cloud components, in the above case AWS components. Modules help organize, encapsulate and re-use configurations along with maintaining consistency. 

## How do I find the right module?
Please refer the tables below to find the right module for system components you want to Observe. 

### AWS Cloudwatch

| **Component** | **Modules**                               | **Expected Variables**                               | **Binary version** |  **Module Version**                                                                                                                | **Changelog**                                                                                       |
|---------------|-------------------------------------------|--------------------------------------------------------|--------------------|------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| **AWS ALB**           | `aws_alb_cloudwatch`                        | `LoadBalancer`                                           | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_alb_v0.0.1.hcl)                           | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/alb/CHANGELOG.md)           |
|               | `aws_alb_target_group_cloudwatch`           | `LoadBalancer`, `TargetGroup`                              |                    |                    |                                                                                                                                    |                                                                                                     |
| **Amazon API Gateway**  | `aws_apigateway_cloudwatch`                 | `ApiName`, `Stage`                                         | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_apigateway_v0.0.1.hcl)             | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/apigateway/CHANGELOG.md)    |
| **Amazon Aurora**        | `aws_aurora_instance_logical_cloudwatch `   | `DBInstanceIdentifier`                                   | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_aurora_v0.0.1.hcl)    | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/aurora/CHANGELOG.md)        |
|               | `aws_aurora_instance_physical_cloudwatch`   | `DBInstanceIdentifier`                                   |                    |                    |                                                                                                                                    |                                                                                                     |
| **AWS Cloudfront**    | `aws_cloudfront_cloudwatch`                 | `DistributionId`, `Region`                             | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_cloudfront_v0.0.1.hcl)             | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/cloudfront/CHANGELOG.md)    |
| **Amazon DAX**           | `aws_dax_cloudwatch`                        | `ClusterId`, `NodeId`                                      | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_dax_v0.0.1.hcl)                           | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/dax/CHANGELOG.md)           |
| **Amazon DynamoDb**      | `aws_dynamodb_table_operation_cloudwatch`   | `TableName`, `Operation`                                   | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_dynamodb_v0.0.1.hcl) | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/dynamodb/CHANGELOG.md)      |
|               | `aws_dynamodb_table_cloudwatch`             | `TableName`                                              |                    |                    |                                                                                                                                    |                                                                                                     |
| **AWS EC2**           | `aws_ec2_cloudwatch`                        | `InstanceId`                                             | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_ec2_v0.0.1.hcl)                           | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/ec2/CHANGELOG.md)           |
| **Amazon EKS**           | `aws_eks_cluster_cloudwatch`                | `ClusterName`                                            | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_eks_v0.0.1.hcl)                   | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/eks/CHANGELOG.md)           |
|               | `aws_eks_service_cloudwatch`                | `ClusterName`, `Namespace`, `Service`                        |                    |                    |                                                                                                                                    |                                                                                                     |
|               | `aws_eks_pod_cloudwatch`                    | `ClusterName`, `Namespace`, `PodName`                        |                    |                    |                                                                                                                                    |                                                                                                     |
|               | `aws_eks_node_cloudwatch `                  | `ClusterName`, `NodeName`, `InstanceId`                     |                    |                    |                                                                                                                                    |                                                                                                     |
| **Amazon ElastiCache** | `aws_elasticache_redis_cloudwatch`          | `CacheClusterId`                                         | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_elasticcache_v0.0.1.hcl)     | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/elasticache/CHANGELOG.md)   |
|               | `aws_elasticache_cluster_cloudwatch`        | `CacheClusterId`                                         |                    |                    |                                                                                                                                    |                                                                                                     |
| **Amazon Elasticsearch** | `aws_elasticsearch_cloudwatch`              | `ClientId`, `DomainName`                               | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             | [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_elasticsearch_v0.0.1.hcl)       | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/elasticsearch/CHANGELOG.md) |
|               | `aws_elasticsearch_master_cloudwatch`       | `ClientId`, `DomainName`                              |                    |                    |                                                                                                                                    |                                                                                                     |
| **Amazon ELB**           | `aws_elb_cloudwatch`                        | `LoadBalancerName`                                       | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_elb_v0.0.1.hcl)                           | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/elb/CHANGELOG.md)           |
| **AWS Lambda**        | `aws_lambda_cloudwatch`                     | `FunctionName`                                           | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_lambda_v0.0.1.hcl)                     | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/lambda/CHANGELOG.md)        |
| **Amazon MSK**           | `aws_msk_topic_per_broker_cloudwatch`       | `Cluster Name`, `Broker ID`, `Topic`                  | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_msk_v0.0.1.hcl)          | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/msk/CHANGELOG.md)           |
|               | `aws_msk_topic_per_consumer_grp_cloudwatch` | `Cluster Name`, `Consumer Group`, `Topic`              |                    |                    |                                                                                                                                    |                                                                                                     |
|               | `aws_msk_partition_cloudwatch`              | `Cluster Name`, `Consumer Group`, `Partition`, `Topic` |                    |                    |                                                                                                                                    |                                                                                                     |
|               | `aws_msk_cluster_cloudwatch`                | `Cluster Name`                                         |                    |                    |                                                                                                                                    |                                                                                                     |
|               | `aws_msk_broker_cloudwatch`                 | `Cluster Name`, `Broker ID`                            |                    |                    |                                                                                                                                    |                                                                                                     |
| **AWS NLB**           | `aws_nlb_cloudwatch`                        | `LoadBalancer`                                           | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_nlb_v0.0.1.hcl)                           | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/nlb/CHANGELOG.md)           |
| **Amazon RDS**           | `aws_rds_cloudwatch`                        | `DBInstanceIdentifier`                                   | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_rds_v0.0.1.hcl)                         | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/rds/CHANGELOG.md)           |
| **Amazon SQS**           | `aws_sqs_cloudwatch`                        | `QueueName`                                              | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_sqs_v0.0.1.hcl)                           | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/aws/cloudwatch/sqs/CHANGELOG.md)           |


### GCP Stackdriver

| **Component**    | **Modules**           | **Expected Variables** | **Binary version** |  **Module Version**                                                                            | **Changelog**                                                              |
|------------------|-----------------------|--------------------------|--------------------|------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| **Google Cloud SQL** | `gcp_cloudsql_logical`  | NA                       | [v0.1.0](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.1/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/gcp_stackdriver_cloudsql_v0.0.1.hcl) | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/gcp/stackdriver/cloudsql/CHANGELOG.md) |
|                  | `gcp_cloudsql_physical` |


## Quick start with Docker-compose
- Create a new repository or local directory where you will be keeping your extended blocks for modules. 
- Openmetrics-exporter needs json file with values of resource identifiers for each resource you want to observe. 
- We have provided a sample script which generates this json file for `RDS` [here]().
- Write a script, test if you are getting expected outcomes. You can find which resource identifier you need to use for every module [here](). 
- Add your credentials and secrets in `openmetrics_exporter.env` file so docker-compose can use those. 
- And that's it, we are ready to start. 
- Now run, 
```
docker-compose up openmetrics-exporter
```
- Now Plug these metrics into any Openmetrics receiver like Prometheus and Done!
- We have also provided a Prometheus block in `docker-compose` file in case you want to start Prometheus.

## Get started with Kubernetes
- There are two files in Kubernetes directory, `ome.yaml` and a configmap generator script. 
- All of your [hcl extended blocks]() should be in the openmetrics-exporter directory along with kubernetes directory. 
- You can generate `ome_data.yaml` that has configmaps for all the extended blocks using:
```
cd k8s
./generate_ome_data.sh -d ../openmetrics-exporter > ome_data.yaml
```
- Add your credentials and secrets in `openmetrics_exporter.env` file. Now run:
```
kubectl create secret generic ome-env --from-env-file=openmetrics_exporter.env
```
or

- Create `ome_secrets.yml` which will contain all the environment variables. 
```
apiVersion: v1
kind: Secret
metadata:
  name: ome-env
type: Opaque
stringData:
  # AWS_DEFAULT_REGION: ap-south-1
  # AWS_ACCESS_KEY_ID: xxxxxx
  # AWS_SECRET_ACCESS_KEY: xxxxxxxxxxxxx
```
- Create the namespace for openmetrics-exporter using
```
Kubectl create ns ome
```
- Deploy openmetrics-exporter on Kubernetes cluster using
```
Kubectl apply -f ome_secrets.yaml -f ome_data.yaml -f ome.yaml -n ome
```
- Now Plug these metrics into any Openmetrics receiver like Prometheus and Done! 

```
Note: We have also provided `ome_prometheus.yaml` which run prometheus agent as a sidecar container along with openmetrics-exporter. 
```

## Learn more about Openmetrics-exporter
- [What is Openmetrics-exporter?](https://last9.notion.site/openmetrics-exporter-06e2b2f0ae404968b4238c32257acc0c)


