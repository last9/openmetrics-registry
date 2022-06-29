ingester aws_elasticache module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  inputs = "[]"

  label {
    type = "service"
    name = "$output{tag_service}"
  }

  label {
    type = "namespace"
    name = "$output{tag_namespace}"
  }

  physical_address {
    type = "elasticache_node"
    name = "0001"
  }

  physical_component {
    type = "elasticache_cluster"
    name = "RDS"
  }

  data_for_graph_node {
    type = "elasticache_database"
    name = "$output{CacheClusterId}-db"
  }

  using = {
    "default" = "$input{using}"
  }


  gauge "curr_connections" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "AVG"

    source prometheus "CurrConnections" {
      query = "max by (CacheClusterId, tag_namespace, tag_service) (curr_connections{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "curr_items" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "CurrItems" {
      query = "max by (CacheClusterId, tag_namespace, tag_service) (curr_items{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "new_connections" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "AVG"

    source prometheus "NewConnections" {
      query = "max by (CacheClusterId, tag_namespace, tag_service) (new_connections{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cache_hit_rate" {
    index       = 4
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "MIN"

    source prometheus "CacheHitRate" {
      query = "min by (CacheClusterId, tag_namespace, tag_service) (cache_hit_rate{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "evictions" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"
    source prometheus "Evictions" {
      query = "sum by (CacheClusterId, tag_namespace, tag_service) (evictions{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cache_hits" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "CacheHits" {
      query = "sum by (CacheClusterId, tag_namespace, tag_service) (cache_hits{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cache_misses" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "CacheMisses" {
      query = "sum by (CacheClusterId, tag_namespace, tag_service) (cache_misses{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "replication_lag" {
    index       = 8
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "MAX"

    source prometheus "ReplicationLag" {
      query = "max by (CacheClusterId, tag_namespace, tag_service) (replication_lag{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cpu_used" {
    index       = 9
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "EngineCPUUtilization" {
      query = "avg by (CacheClusterId, tag_namespace, tag_service) (cpu_used{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "bytes_out" {
    index       = 11
    input_unit  = "bytes"
    output_unit = "bps"
    aggregator  = "SUM"

    source prometheus "NetworkBytesOut" {
      query = "sum by (CacheClusterId, tag_namespace, tag_service) (bytes_out{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "bytes_in" {
    index       = 12
    input_unit  = "bytes"
    output_unit = "bps"
    aggregator  = "SUM"

    source prometheus "NetworkBytesIn" {
      query = "sum by (CacheClusterId, tag_namespace, tag_service) (bytes_in{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "memory_used" {
    index       = 13
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "DatabaseMemoryUsagePercentage" {
      query = "sum by (CacheClusterId, tag_namespace, tag_service) (memory_used{CacheClusterId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_min" {
    index       = 14
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (CacheClusterId, tag_namespace, tag_service) (latency_min{CacheClusterId!='', tag_service!='', tag_namespace!=''})*1000"
    }
  }

  gauge "latency_max" {
    index       = 15
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by (CacheClusterId, tag_namespace, tag_service) (latency_max{CacheClusterId!='', tag_service!='', tag_namespace!=''})*1000"
    }
  }
}
