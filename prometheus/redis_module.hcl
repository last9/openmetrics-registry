ingester redis_single_node module {
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

  physical_component {
    type = "redis_cluster_group_1"
    name = "redis_cluster_group_1"
  }

  data_for_graph_node {
    type = "redis_cluster_1"
    name = "$output{cluster}"
  }

  using = {
    "default" : "$input{using}"
  }


  gauge "cache_miss_rate" {
    index       = 1
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "cache_miss_rate" {
      query = "cache_miss_rate{tag_component='redis'}"
    }
  }

  gauge "uptime" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "uptime" {
      query = "uptime{tag_component='redis'}"
    }
  }
  gauge "evicted_keys" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "AVG"

    source prometheus "evicted_keys" {
      query = "evicted_keys{tag_component='redis'}"
    }
  }


  gauge "total_keys" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "total_keys" {
      query = "total_keys{tag_component='redis'}"
    }
  }


  gauge "throughput" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "throughput{tag_component='redis'}"
    }
  }


  gauge "max_latency" {
    index       = 6
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "AVG"

    source prometheus "max_latency" {
      query = "max_latency{tag_component='redis'}"
    }
  }

  gauge "blocked_clients" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "blocked_clients" {
      query = "blocked_clients{tag_component='redis'}"
    }
  }

  gauge "connections" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "connections" {
      query = "connections{tag_component='redis'}"
    }
  }

  gauge "rejected_connections" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "rejected_connections" {
      query = "rejected_connections{tag_component='redis'}"
    }
  }

  gauge "memory" {
    index       = 11
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "AVG"

    source prometheus "memory" {
      query = "memory{tag_component='redis'}"
    }
  }

  gauge "memory_defragmentation_ratio" {
    index       = 12
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "AVG"

    source prometheus "memory_defragmentation_ratio" {
      query = "memory_defragmentation_ratio{tag_component='redis'}"
    }
  }

  gauge "network_in" {
    index       = 13
    input_unit  = "Bps"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "network_in" {
      query = "network_in{tag_component='redis'}"
    }
  }

  gauge "network_out" {
    index       = 14
    input_unit  = "Bps"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "network_out" {
      query = "network_out{tag_component='redis'}"
    }
  }
}
