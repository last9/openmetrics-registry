scraper aws_elasticache_redis_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "curr_connections" {
    source cloudwatch "CurrConnections" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ElastiCache"
        metric_name = "CurrConnections"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "new_connections" {
    source cloudwatch "NewConnections" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ElastiCache"
        metric_name = "NewConnections"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "curr_items" {
    source cloudwatch "CurrItems" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ElastiCache"
        metric_name = "CurrItems"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "cache_hit_rate" {
    source cloudwatch "CacheHitRate" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ElastiCache"
        metric_name = "CacheHitRate"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "cache_hits" {
    source cloudwatch "CacheHits" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ElastiCache"
        metric_name = "CacheHits"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "cache_misses" {
    source cloudwatch "CacheMisses" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ElastiCache"
        metric_name = "CacheMisses"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "evictions" {
    source cloudwatch "Evictions" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ElastiCache"
        metric_name = "Evictions"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  vector "latency" {
    dimension_label = "stat"

    source cloudwatch "min" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ElastiCache"
        metric_name = "SetTypeCmdsLatency"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }

    source cloudwatch "max" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ElastiCache"
        metric_name = "SetTypeCmdsLatency"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }

    source cloudwatch "avg" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/ElastiCache"
        metric_name = "SetTypeCmdsLatency"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }
}

scraper aws_elasticache_cluster_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "replication_lag" {
    source cloudwatch "ReplicationLag" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ElastiCache"
        metric_name = "ReplicationLag"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "bytes_out" {
    source cloudwatch "NetworkBytesOut" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ElastiCache"
        metric_name = "NetworkBytesOut"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "bytes_in" {
    source cloudwatch "NetworkBytesIn" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ElastiCache"
        metric_name = "NetworkBytesIn"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "cpu_used" {
    source cloudwatch "EngineCPUUtilization" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/ElastiCache"
        metric_name = "EngineCPUUtilization"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }

  gauge "memory_used" {
    source cloudwatch "DatabaseMemoryUsagePercentage" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/ElastiCache"
        metric_name = "DatabaseMemoryUsagePercentage"

        dimensions = {
          CacheClusterId = resources.each.CacheClusterId
          CacheNodeId    = "0001"
        }
      }
    }
  }
}
