ingester aws_aurora module {
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
    type = "rds_physical"
    name = "$output{DBInstanceIdentifier}"
  }

  physical_component {
    type = "rds"
    name = "RDS"
  }

  data_for_graph_node {
    type = "rds_database"
    name = "$output{DBInstanceIdentifier}-db"
  }

  using = {
    "default" = "$input{using}"
  }

  gauge "connections" {
    index       = 1
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "MAX"
    source prometheus "connections" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (connections{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "read_throughput" {
    index       = 2
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"
    source prometheus "read_throughput" {
      query = "sum by (DBInstanceIdentifier, tag_namespace, tag_service) (read_throughput{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }


  gauge "read_latency" {
    index       = 3
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "MAX"
    source prometheus "read_latency" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (read_latency{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "write_throughput" {
    index       = 4
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"
    source prometheus "write_throughput" {
      query = "sum by (DBInstanceIdentifier, tag_namespace, tag_service) (write_throughput{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "write_latency" {
    index       = 5
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "MAX"
    source prometheus "write_latency" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (write_latency{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "update_throughput" {
    index       = 6
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"
    source prometheus "update_throughput" {
      query = "sum by (DBInstanceIdentifier, tag_namespace, tag_service) (update_throughput{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "update_latency" {
    index       = 7
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "MAX"
    source prometheus "update_latency" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (update_latency{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "delete_throughput" {
    index       = 8
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"
    source prometheus "delete_throughput" {
      query = "sum by (DBInstanceIdentifier, tag_namespace, tag_service) (delete_throughput{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "delete_latency" {
    index       = 9
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "MAX"
    source prometheus "delete_latency" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (delete_latency{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "deadlocks" {
    index       = 11
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"
    source prometheus "deadlocks" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (deadlocks{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "network_in" {
    index       = 12
    input_unit  = "bps"
    output_unit = "bps"
    aggregator  = "AVG"
    source prometheus "network_in" {
      query = "avg by (DBInstanceIdentifier, tag_namespace, tag_service) (network_in{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "network_out" {
    index       = 13
    input_unit  = "bps"
    output_unit = "bps"
    aggregator  = "AVG"
    source prometheus "network_out" {
      query = "avg by (DBInstanceIdentifier, tag_namespace, tag_service) (network_out{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "cpu" {
    index       = 14
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"
    source prometheus "cpu" {
      query = "avg by (DBInstanceIdentifier, tag_namespace, tag_service) (cpu{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "free_space" {
    index       = 15
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "MIN"
    source prometheus "free_space" {
      query = "min by (DBInstanceIdentifier, tag_namespace, tag_service) (free_space{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "replica_lag" {
    index       = 16
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "MAX"
    source prometheus "replica_lag" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (replica_lag{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

  gauge "queue_depth" {
    index       = 17
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"
    source prometheus "queue_depth" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (queue_depth{DBInstanceIdentifier!='', tag_service!='', tag_namespace!='', rds_type='aurora'})"
    }
  }

}
