ingester prometheus_node_exporter module {
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
    name = "$output{environment}"
  }

  physical_component {
    type = "datacenter"
    name = "datacenter-nodes"
  }

  data_for_graph_node {
    type = "server_node_endpoint"
    name = "$output{environment}/$output{server_name}"
  }

  using = {
    "default" : "$input{using}"
  }

  gauge "cpu" {
    index       = 1
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "MAX"

    source prometheus "cpu" {
      query = "max by (job, environment, server_name, tag_service) (cpu{job!='', server_name!='', environment!='', tag_component='node'})"
    }
  }

  gauge "memory" {
    index       = 2
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "MAX"

    source prometheus "memory" {
      query = "max by (job, environment, server_name, tag_service) (memory{job!='', server_name!='', environment!='', tag_component='node'})"
    }
  }

  gauge "disk_read_ops" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "disk_read_ops" {
      query = "sum by (job, environment, server_name, tag_service) (increase(disk_read_ops{job!='', server_name!='', environment!='', tag_component='node'}[1m]))"
    }
  }

  gauge "disk_write_ops" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "disk_write_ops" {
      query = "sum by (job, environment, server_name, tag_service) (increase(disk_write_ops{job!='', server_name!='', environment!='', tag_component='node'}[1m]))"
    }
  }

  gauge "network_in" {
    index       = 5
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "SUM"

    source prometheus "network_in" {
      query = "sum by (job, environment, server_name, tag_service) (increase(network_in{job!='', server_name!='', environment!='', tag_component='node'}[1m]))"
    }
  }

  gauge "network_out" {
    index       = 6
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "SUM"

    source prometheus "network_out" {
      query = "sum by (job, environment, server_name, tag_service) (increase(network_out{job!='', server_name!='', environment!='', tag_component='node'}[1m]))"
    }
  }

  gauge "root_disk_used" {
    index       = 7
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "MAX"

    source prometheus "root_disk_used" {
      query = "max by (job, environment, server_name, tag_service) (root_disk_used{job!='', server_name!='', environment!='', tag_component='node'})"
    }
  }

}
