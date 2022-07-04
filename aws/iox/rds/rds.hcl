ingester aws_rds module {
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
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "connections" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (connections{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "ebs_io_balance" {
    index       = 6
    input_unit  = "percentage"
    output_unit = "percentage"
    aggregator  = "MIN"

    source prometheus "ebs_io_balance" {
      query = "min by (DBInstanceIdentifier, tag_namespace, tag_service) (ebs_io_balance{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "ebs_byte_balance" {
    index       = 7
    input_unit  = "percentage"
    output_unit = "percentage"
    aggregator  = "MIN"

    source prometheus "ebs_byte_balance" {
      query = "min by (DBInstanceIdentifier, tag_namespace, tag_service) (ebs_byte_balance{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cpu" {
    index       = 8
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "cpu" {
      query = "avg by (DBInstanceIdentifier, tag_namespace, tag_service) (cpu{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "burst_balance" {
    index       = 14
    input_unit  = "percentage"
    output_unit = "percentage"
    aggregator  = "MIN"

    source prometheus "write_iops" {
      query = "min by (DBInstanceIdentifier, tag_namespace, tag_service) (burst_balance{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cpu_balance" {
    index       = 13
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "read_iops" {
      query = "min by (DBInstanceIdentifier, tag_namespace, tag_service) (read_iops{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "read_latency" {
    index       = 4
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "SUM"

    source prometheus "read_latency" {
      query = "sum by (DBInstanceIdentifier, tag_namespace, tag_service) (read_latency{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "write_latency" {
    index       = 5
    input_unit  = "s"
    output_unit = "s"
    aggregator  = "SUM"

    source prometheus "write_latency" {
      query = "sum by (DBInstanceIdentifier, tag_namespace, tag_service) (write_latency{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "network_in" {
    index       = 15
    input_unit  = "bps"
    output_unit = "bps"
    aggregator  = "AVG"

    source prometheus "network_in" {
      query = "avg by (DBInstanceIdentifier, tag_namespace, tag_service) (network_in{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "network_out" {
    index       = 16
    input_unit  = "bps"
    output_unit = "bps"
    aggregator  = "AVG"

    source prometheus "network_out" {
      query = "avg by (DBInstanceIdentifier, tag_namespace, tag_service) (network_out{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "free_space" {
    index       = 9
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "MIN"

    source prometheus "free_space" {
      query = "min by (DBInstanceIdentifier, tag_namespace, tag_service) (free_space{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "replica_lag" {
    index       = 11
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "replica_lag" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (replica_lag{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "queue_depth" {
    index       = 12
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "queue_depth" {
      query = "max by (DBInstanceIdentifier, tag_namespace, tag_service) (queue_depth{DBInstanceIdentifier!='', tag_service!='', tag_namespace!=''})"
    }
  }
}
