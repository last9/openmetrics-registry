ingester aws_dynamodb_table module {
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
    type = "dynamodb"
    name = "$output{TableName}"
  }

  physical_component {
    type = "dynamodb_physical"
    name = "Dynamodb"
  }

  data_for_graph_node {
    type = "dynamodb_logical"
    name = "$output{TableName}"
  }

  using = {
    "default" : "$input{using}"
  }

  gauge "rcu" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "rcu" {
      query = "sum by (tag_service, tag_namespace, TableName) (rcu{TableName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "wcu" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "wcu" {
      query = "sum by (tag_service, tag_namespace, TableName) (wcu{TableName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "read_throttled" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "read_throttled" {
      query = "sum by (tag_service, tag_namespace, TableName) (read_throttled{TableName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "write_throttled" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "write_throttled" {
      query = "sum by (tag_service, tag_namespace, TableName) (write_throttled{TableName!='', tag_service!='', tag_namespace!=''})"
    }
  }
}
