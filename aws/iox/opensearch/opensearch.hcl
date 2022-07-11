ingester aws_opensearch module {
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
    type = "aws_opensearch_cluster_physical"
    name = "$output{DomainName}"
  }

  physical_component {
    type = "aws_opensearch_cluster"
    name = "Opensearch Cluster"
  }

  data_for_graph_node {
    type = "aws_opensearch_domain"
    name = "$output{DomainName}-domain"
  }

  using = {
    "default" = "$input{using}"
  }

  gauge "nodes" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "nodes" {
      query = "max by (ClientId, DomainName, tag_namespace, tag_service) (nodes{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "kibana_healthy_nodes" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "kibana_healthy_nodes" {
      query = "min by (ClientId, DomainName, tag_namespace, tag_service) (kibana_healthy_nodes{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "cluster_yellow" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "cluster_yellow" {
      query = "max by (ClientId, DomainName, tag_namespace, tag_service) (cluster_yellow{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "cluster_red" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "cluster_red" {
      query = "max by (ClientId, DomainName, tag_namespace, tag_service) (cluster_red{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "throughput" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (ClientId, DomainName, tag_namespace, tag_service) (throughput{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (ClientId, DomainName, tag_namespace, tag_service) (status_4xx{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }


  gauge "status_5xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (ClientId, DomainName, tag_namespace, tag_service) (status_5xx{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "cpu" {
    index       = 8
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "cpu" {
      query = "avg by (ClientId, DomainName, tag_namespace, tag_service) (cpu{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "free_space" {
    index       = 11
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "MIN"

    source prometheus "free_space" {
      query = "sum by (ClientId, DomainName, tag_namespace, tag_service) (free_space{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "jvm_memory_pressure" {
    index       = 12
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "jvm_memory_pressure" {
      query = "max by (ClientId, DomainName, tag_namespace, tag_service) (jvm_memory_pressure{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "writes_blocked" {
    index       = 13
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "writes_blocked" {
      query = "max by (ClientId, DomainName, tag_namespace, tag_service) (writes_blocked{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "snapshot_failure" {
    index       = 14
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "snapshot_failure" {
      query = "max by (ClientId, DomainName, tag_namespace, tag_service) (snapshot_failure{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

  gauge "master_reachable" {
    index       = 15
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "master_reachable" {
      query = "min by (ClientId, DomainName, tag_namespace, tag_service) (master_reachable{ClientId!='', DomainName!='', tag_namespace!='', tag_service!=''})"
    }
  }

}
