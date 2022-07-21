ingester prometheus_istio_workload module {
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

  physical_component {
    type = "k8s__cluster"
    name = "K8s Cluster"
  }

  physical_address {
    type = "k8s__pod"
    name = "$output{pod_name}"
  }

  data_for_graph_node {
    type = "istio_deployment"
    name = "$output{destination_workload}-$output{destination_version}"
  }

  using = {
    default = "$input{using}"
  }

  gauge "throughput" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(throughput{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "status_2xx" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(status_2xx{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "status_3xx" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(status_3xx{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(status_4xx{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "status_5xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(status_5xx{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "bytes_in" {
    index       = 1
    input_unit  = "Bps"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "bytes_in" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(bytes_in{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "bytes_out" {
    index       = 2
    input_unit  = "Bps"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "bytes_out" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(bytes_out{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "latency_max" {
    index       = 8
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(latency_max{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "latency_min" {
    index       = 9
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(latency_min{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "latency_count" {
    index       = 11
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "latency_count" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(latency_count{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }

  gauge "latency_sum" {
    index       = 12
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "SUM"

    source prometheus "latency_sum" {
      query = "sum by (pod_name, destination_canonical_service,destination_workload_namespace, destination_version, destination_workload)(latency_sum{tag_component='istio_workload',destination_canonical_service!=''})"
    }
  }
}
ingester prometheus_istio_k8s_pod module {
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

  //physical_address {
  //  type = "k8s__pod"
  //  name = "$output{pod_name}"
  //}

  physical_component {
    type = "k8s__cluster"
    name = "K8s Cluster"
  }

  data_for_graph_node {
    type = "k8s__pod"
    name = "$output{pod_name}"
  }

  logical_parent_nodes = [
    {
      type = "istio_deployment"
      name = "$output{destination_workload}-$output{destination_version}"
    }
  ]


  using = {
    default = "$input{using}"
  }

  gauge "throughput" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (throughput{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "status_2xx" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (status_2xx{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "status_3xx" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (status_3xx{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (status_4xx{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "status_5xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (status_5xx{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "bytes_in" {
    index       = 1
    input_unit  = "Bpw"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "bytes_in" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (bytes_in{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "bytes_out" {
    index       = 2
    input_unit  = "Bps"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "bytes_out" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (bytes_out{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "latency_max" {
    index       = 8
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (latency_max{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "latency_min" {
    index       = 9
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (latency_min{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "latency_count" {
    index       = 11
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "latency_count" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (latency_count{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }

  gauge "latency_sum" {
    index       = 12
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "SUM"

    source prometheus "latency_sum" {
      query = "sum by ( pod_name, destination_canonical_service, destination_workload_namespace,destination_workload, destination_version) (latency_sum{tag_component='istio_pod', destination_canonical_service!=''})"
    }
  }


}
