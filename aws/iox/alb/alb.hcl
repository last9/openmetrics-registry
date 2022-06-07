ingester aws_alb module {
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
    type = "alb_physical"
    name = "ALB"
  }

  data_for_graph_node {
    type = "alb"
    name = "$output{LoadBalancer}"
  }

  using = {
    "default" : "$input{using}"
  }

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (throughput{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "new_connections" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "new_connections" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (new_connections{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "rejected_connections" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "rejected_connections" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (rejected_connections{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "processed_bytes" {
    index       = 4
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "SUM"

    source prometheus "processed_bytes" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (processed_bytes{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "lcu" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "lcu" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (lcu{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_2xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_2xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_3xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_3xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_4xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_5xx" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_5xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "lb_4xx" {
    index       = 11
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "lb_4xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (lb_4xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "lb_5xx" {
    index       = 12
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "lb_5xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (lb_5xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_min" {
    index       = 13
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (tag_service, tag_namespace, LoadBalancer) (latency_min{LoadBalancer!='', quantile='0',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_max" {
    index       = 14
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by (tag_service, tag_namespace, LoadBalancer) (latency_max{LoadBalancer!='', quantile='1',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_sum" {
    index       = 15
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "SUM"

    source prometheus "latency_sum" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (latency_sum{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_count" {
    index       = 16
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "latency_count" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (latency_count{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }
}

ingester aws_alb_endpoint module {
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
    type = "alb"
    name = "$output{LoadBalancer}"
  }

  physical_component {
    type = "alb_physical"
    name = "ALB"
  }

  data_for_graph_node {
    type = "alb_endpoint"
    name = "$output{tag_service}/"
  }

  using = {
    "default" : "$input{using}"
  }

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (throughput{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_2xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_2xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_3xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_3xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_4xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_5xx" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (status_5xx{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_min" {
    index       = 13
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (tag_service, tag_namespace, LoadBalancer) (latency_min{LoadBalancer!='', quantile='0',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_max" {
    index       = 14
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by (tag_service, tag_namespace, LoadBalancer) (latency_max{LoadBalancer!='', quantile='1',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_sum" {
    index       = 15
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "SUM"

    source prometheus "latency_sum" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (latency_sum{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_count" {
    index       = 16
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "latency_count" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (latency_count{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }
}

ingester aws_alb_tg module {
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
    type = "alb"
    name = "ALB"
  }

  physical_address {
    type = "alb_target_group"
    name = "$output{TargetGroup}"
  }

  data_for_graph_node {
    type = "alb_logical"
    name = "lb: $output{LoadBalancer}"
  }

  using = {
    "default" : "$input{using}"
  }

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (throughput{LoadBalancer!='', TargetGroup=~'.+', AvailabilityZone='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_2xx" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_200" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (status_2xx{LoadBalancer!='', TargetGroup=~'.+', AvailabilityZone='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_3xx" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_300" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (status_3xx{LoadBalancer!='', TargetGroup=~'.+', AvailabilityZone='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_400" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (4status_4xx{LoadBalancer!='', TargetGroup=~'.+', AvailabilityZone='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_5xx" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_500" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (status_5xx{LoadBalancer!='', TargetGroup=~'.+', AvailabilityZone='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_min" {
    index       = 6
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (latency_min{LoadBalancer!='', TargetGroup=~'.+', quantile='0', AvailabilityZone=''})"
    }
  }

  gauge "latency_max" {
    index       = 7
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_max" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (latency_max{LoadBalancer!='', TargetGroup=~'.+', quantile='1', AvailabilityZone=''})"
    }
  }

  gauge "latency_sum" {
    index       = 8
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "SUM"

    source prometheus "latency_sum" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (latency_sum{LoadBalancer!='', TargetGroup=~'.+', AvailabilityZone='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_count" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "latency_count" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer, TargetGroup) (latency_count{LoadBalancer!='', TargetGroup=~'.+', AvailabilityZone='', tag_service!='', tag_namespace!=''})"
    }
  }
}
