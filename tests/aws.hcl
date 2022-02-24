config cloudwatch "default" {
  region     = "ap-south-1"
  access_key = env("AWS_ACCESS_KEY")
  secret_key = env("AWS_SECRET_KEY")
}

extends aws_alb_cloudwatch "alb_ap-south-1" {
  module_uri = "../aws/cloudwatch/alb/alb.hcl"
  resources  = <<-EOF
    [{"LoadBalancer": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}



extends aws_aurora_instance_logical_cloudwatch "aws_aurora_instance_logical_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/aurora/aurora.hcl"
  resources  = <<-EOF
    [{"DBInstanceIdentifier": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_aurora_instance_physical_cloudwatch "aws_aurora_instance_physical_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/aurora/aurora.hcl"
  resources  = <<-EOF
    [{"DBInstanceIdentifier": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_dynamodb_table_operation_cloudwatch "aws_dynamodb_table_operation_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/dynamodb/dynamodb.hcl"
  resources  = <<-EOF
    [{"TableName": "blah_1", "Operation": "blah"}]
  EOF
  using = {
    default = "default"
  }
}
#
extends aws_dynamodb_table_cloudwatch "aws_dynamodb_table_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/dynamodb/dynamodb.hcl"
  resources  = <<-EOF
    [{"TableName": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_lambda_cloudwatch "aws_lambda_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/lambda/lambda.hcl"
  resources  = <<-EOF
    [{"FunctionName": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_apigateway_cloudwatch "aws_apigateway_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/apigateway/apigateway.hcl"
  resources  = <<-EOF
    [{"ApiName": "blah", "Stage": "foo"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_msk_topic_per_broker_cloudwatch "aws_msk_topic_per_broker_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/msk/msk.hcl"
  resources  = <<-EOF
    [{"ClusterName": "blah_1", "BrokerID": "blah", "Topic": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_msk_topic_per_consumer_grp_cloudwatch "aws_msk_topic_per_consumer_grp_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/msk/msk.hcl"
  resources  = <<-EOF
    [{"ClusterName": "blah_1", "ConsumerGroup": "blah", "Topic": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_msk_partition_cloudwatch "aws_msk_partition_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/msk/msk.hcl"
  resources  = <<-EOF
    [{"ClusterName": "blah_1", "Partition": "blah", "ConsumerGroup": "blah", "Topic": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_msk_cluster_cloudwatch "aws_msk_cluster_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/msk/msk.hcl"
  resources  = <<-EOF
    [{"ClusterName": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_msk_broker_cloudwatch "aws_msk_broker_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/msk/msk.hcl"
  resources  = <<-EOF
    [{"ClusterName": "blah_1", "BrokerID": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_sqs_cloudwatch "aws_sqs_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/sqs/sqs.hcl"
  resources  = <<-EOF
    [{"QueueName": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_nlb_cloudwatch "aws_nlb_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/nlb/nlb.hcl"
  resources  = <<-EOF
    [{"LoadBalancer": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_cloudfront_cloudwatch "aws_cloudfront_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/cloudfront/cloudfront.hcl"
  resources  = <<-EOF
    [{"DistributionId": "blah_1", "Region": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_ec2_cloudwatch "aws_ec2_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/ec2/ec2.hcl"
  resources  = <<-EOF
    [{"InstanceId": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_rds_cloudwatch "aws_rds_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/rds/rds.hcl"
  resources  = <<-EOF
    [{"DBInstanceIdentifier": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_elasticache_redis_cloudwatch "aws_elasticache_redis_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/elasticcache/elasticcache.hcl"
  resources  = <<-EOF
    [{"CacheClusterId": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_elasticache_cluster_cloudwatch "aws_elasticache_cluster_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/elasticcache/elasticcache.hcl"
  resources  = <<-EOF
    [{"CacheClusterId": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_alb_cloudwatch "aws_alb_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/alb/alb.hcl"
  resources  = <<-EOF
    [{"LoadBalancer": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_alb_target_group_cloudwatch "aws_alb_target_group_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/alb/alb.hcl"
  resources  = <<-EOF
    [{"LoadBalancer": "blah_1", "TargetGroup": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_elasticsearch_cloudwatch "aws_elasticsearch_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/elasticsearch/elasticsearch.hcl"
  resources  = <<-EOF
    [{"DomainName": "blah_1", "ClientId": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_elasticsearch_master_cloudwatch "aws_elasticsearch_master_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/elasticsearch/elasticsearch.hcl"
  resources  = <<-EOF
    [{"DomainName": "blah_1", "ClientId": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_eks_cluster_cloudwatch "aws_eks_cluster_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/eks/eks.hcl"
  resources  = <<-EOF
    [{"ClusterName": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_eks_service_cloudwatch "aws_eks_service_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/eks/eks.hcl"
  resources  = <<-EOF
  [{"ClusterName": "blah_1", "Namespace": "blah", "Service": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_eks_pod_cloudwatch "aws_eks_pod_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/eks/eks.hcl"
  resources  = <<-EOF
  [{"ClusterName": "blah_1", "Namespace": "blah", "Service": "blah", "PodName": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_eks_node_cloudwatch "aws_eks_node_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/eks/eks.hcl"
  resources  = <<-EOF
    [{"ClusterName": "blah_1", "InstanceId": "blah", "NodeName": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_elb_cloudwatch "aws_elb_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/elb/elb.hcl"
  resources  = <<-EOF
    [{"LoadBalancerName": "blah_1"}]
  EOF
  using = {
    default = "default"
  }
}

extends aws_dax_cloudwatch "aws_dax_cloudwatch_test" {
  module_uri = "../aws/cloudwatch/dax/dax.hcl"
  resources  = <<-EOF
  [{"ClusterId": "blah_1", "NodeId": "blah"}]
  EOF
  using = {
    default = "default"
  }
}

