scraper aws_msk_topic_per_broker_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "bytes_in" {
    source cloudwatch "data_in" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/Kafka"
        metric_name = "BytesInPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
          "Topic"        = resources.each.Topic
        }
      }
    }
  }

  gauge "bytes_out" {
    source cloudwatch "data_out" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/Kafka"
        metric_name = "BytesOutPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
          "Topic"        = resources.each.Topic
        }
      }
    }
  }

  gauge "messages_in" {
    source cloudwatch "messages_in" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "MessagesInPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
          "Topic"        = resources.each.Topic
        }
      }
    }
  }

  gauge "fetch_msg_conversions" {
    source cloudwatch "fetch_msg_conversions" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "FetchMessageConversionsPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
          "Topic"        = resources.each.Topic
        }
      }
    }
  }

  gauge "produce_msg_conversions" {
    source cloudwatch "produce_msg_conversions" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "ProduceMessageConversionsPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
          "Topic"        = resources.each.Topic
        }
      }
    }
  }
}

scraper aws_msk_topic_per_consumer_grp_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "offset_lag" {
    source cloudwatch "offset_lag" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Kafka"
        metric_name = "SumOffsetLag"

        dimensions = {
          "Cluster Name"   = resources.each.ClusterName
          "Consumer Group" = resources.each.ConsumerGroup
          "Topic"          = resources.each.Topic
        }
      }
    }
  }
}


scraper aws_msk_partition_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "offset_lag" {
    source cloudwatch "offset_lag" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Kafka"
        metric_name = "OffsetLag"

        dimensions = {
          "Cluster Name"   = resources.each.ClusterName
          "Consumer Group" = resources.each.ConsumerGroup
          "Partition"      = resources.each.Partition
          "Topic"          = resources.each.Topic
        }
      }
    }
  }

  gauge "time_lag" {
    source cloudwatch "time_lag" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Kafka"
        metric_name = "EstimatedTimeLag"

        dimensions = {
          "Cluster Name"   = resources.each.ClusterName
          "Consumer Group" = resources.each.ConsumerGroup
          "Partition"      = resources.each.Partition
          "Topic"          = resources.each.Topic
        }
      }
    }
  }
}

scraper aws_msk_cluster_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "active_controller_count" {
    source cloudwatch "active_controller_count" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Kafka"
        metric_name = "ActiveControllerCount"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
        }
      }
    }
  }

  gauge "offline_partition_count" {
    source cloudwatch "offline_partition_count" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Kafka"
        metric_name = "OfflinePartitionsCount"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
        }
      }
    }
  }
}

scraper aws_msk_broker_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "mem_free" {
    source cloudwatch "mem_free" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/Kafka"
        metric_name = "MemoryFree"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "messages_in" {
    source cloudwatch "messages_in" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "MessagesInPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "partition_count" {
    source cloudwatch "partition_count" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/Kafka"
        metric_name = "PartitionCount"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "produce_time_ms_mean" {
    source cloudwatch "produce_time_ms_mean" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "ProduceTotalTimeMsMean"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "request_bytes_mean" {
    source cloudwatch "request_bytes_mean" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/Kafka"
        metric_name = "RequestBytesMean"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "request_time" {
    source cloudwatch "request_time" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "RequestTime"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "produce_msg_conversions" {
    source cloudwatch "produce_msg_conversions" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "ProduceMessageConversionsPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "fetch_msg_conversions" {
    source cloudwatch "fetch_msg_conversions" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "FetchMessageConversionsPerSec"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "fetch_time_ms_mean" {
    source cloudwatch "fetch_time_ms_mean" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Kafka"
        metric_name = "FetchConsumerTotalTimeMsMean"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }

  gauge "root_disk_used" {
    source cloudwatch "root_disk_used" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Kafka"
        metric_name = "RootDiskUsed"

        dimensions = {
          "Cluster Name" = resources.each.ClusterName
          "Broker ID"    = resources.each.BrokerID
        }
      }
    }
  }
}
