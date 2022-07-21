ingester prometheus_istio_tcp_workload module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  inputs = "[]"

  label {
    type = "service"
    name = "$output{destination_canonical_service}"
  }

  label {
    type = "namespace"
    name = "$output{destination_workload_namespace}"
  }

  physical_address {
    type = "k8s_tcp_pod"
    name = "tcp pod"
  }

  physical_component {
    type = "k8s_tcp_cluster"
    name = "k8s_tcp_cluster"
  }

  data_for_graph_node {
    type = "istio_tcp_deployment"
    name = "$output{destination_workload}-$output{destination_canonical_service}"
  }

  using = {
    default = "$input{using}"
  }

  gauge "open_connections" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "open_connections" {
      query = "sum by (destination_canonical_service, destination_service_name,  destination_workload, destination_workload_namespace, destination_version) (open_connections{destination_canonical_service!='', tag_component='istio_tcp_workload'})"
    }
  }

  gauge "closed_connections" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "closed_connections" {
      query = "sum by(destination_canonical_service, destination_service_name, destination_workload, destination_workload_namespace, destination_version) (closed_connections{destination_canonical_service!='', tag_component='istio_tcp_workload'})"

    }
  }

  gauge "bytes_in" {
    index       = 1
    input_unit  = "Bps"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "bytes_in" {
      query = "sum by(destination_canonical_service, destination_service_name, destination_workload, destination_workload_namespace, destination_version) (bytes_in{destination_canonical_service!='', tag_component='istio_tcp_workload'})"
    }
  }

  gauge "bytes_out" {
    index       = 2
    input_unit  = "Bps"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "bytes_out" {
      query = "sum by(destination_canonical_service, destination_service_name, destination_workload, destination_workload_namespace, destination_version) (bytes_out{destination_canonical_service!='', tag_component='istio_tcp_workload'})"

    }
  }
}
