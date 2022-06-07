ingester aws_dax module {
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
    type = "dax_node"
    name = "$output{NodeId}"
  }

  physical_component {
    type = "dax_cluster"
    name = "Dax Cluster"
  }

  data_for_graph_node {
    type = "dax"
    name = "$output{ClusterId}-dax"
  }

  using = {
    "default" : "$input{using}"
  }

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (tag_service, tag_namespace, ClusterId, NodeId) (throughput{ClusterId!='',NodeId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "errored" {
    index       = 2
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"

    source prometheus "errors" {
      query = "sum by (tag_service, tag_namespace, ClusterId, NodeId) (errors{ClusterId!='',NodeId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "throttled" {
    index       = 3
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"

    source prometheus "throttled" {
      query = "sum by (tag_service, tag_namespace, ClusterId, NodeId) (throttled{ClusterId!='',NodeId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "connections" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "connections" {
      query = "sum by (tag_service, tag_namespace, ClusterId, NodeId) (connections{ClusterId!='',NodeId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "query_miss" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "memory" {
      query = "sum by (tag_service, tag_namespace, ClusterId, NodeId) (query_miss{ClusterId!='',NodeId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cache_memory" {
    index       = 6
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "memory" {
      query = "sum by (tag_service, tag_namespace, ClusterId, NodeId) (cache_memory{ClusterId!='',NodeId!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "cpu" {
    index       = 7
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "cpu" {
      query = "sum by (tag_service, tag_namespace, ClusterId, NodeId) (cpu{ClusterId!='',NodeId!='', tag_service!='', tag_namespace!=''})"
    }
  }
}
