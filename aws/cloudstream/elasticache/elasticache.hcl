scraper aws_elasticache_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "curr_connections" {
    source promql "curr_connections" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_CurrConnections{quantile='1', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "new_connections" {
    source promql "new_connections" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_NewConnections{quantile='1', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "curr_items" {
    source promql "curr_items" {
      query = "max by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_CurrItems{quantile='1', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "cache_hit_rate" {
    source promql "cache_hit_rate" {
      query = "min by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_CacheHitRate{quantile='0', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "cache_hits" {
    source promql "cache_hits" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_CacheHits{quantile='1', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "cache_misses" {
    source promql "cache_misses" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_CacheMisses{quantile='1', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "evictions" {
    source promql "evictions" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_Evictions_sum{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "replication_lag" {
    source promql "replication_lag" {
      query = "max by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_ReplicationLag{quantile='1', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "cpu_used" {
    source promql "cpu_used" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_EngineCPUUtilization_sum{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'}) / sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_EngineCPUUtilization_count{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "bytes_out" {
    source promql "bytes_out" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_NetworkBytesOut_sum{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "bytes_in" {
    source promql "bytes_in" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_NetworkBytesIn_sum{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "memory_used" {
    source promql "memory_used" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_DatabaseMemoryUsagePercentage_sum{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'}) / sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_DatabaseMemoryUsagePercentage_count{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "latency_sum" {
    source promql "latency_sum" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_SetTypeCmdsLatency_sum{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "latency_count" {
    source promql "latency_count" {
      query = "sum by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_SetTypeCmdsLatency_count{CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "latency_min" {
    source promql "latency_min" {
      query = "min by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_SetTypeCmdsLatency{quantile='0', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }

  gauge "latency_max" {
    source promql "latency_max" {
      query = "max by (CacheClusterId) (amazonaws_com_AWS_ElastiCache_SetTypeCmdsLatency{quantile='1', CacheClusterId=~'${join("|", resources.all.CacheClusterId)}', CacheNodeId='0001'})"
    }
  }
}
