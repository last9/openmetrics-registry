ingester aws_elb module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  label {
    type = "service"
    name = "$output{tag_service}"
  }

  label {
    type = "namespace"
    name = "$output{tag_namespace}"
  }

  physical_address {
    type = "elb"
    name = "$output{LoadBalancerName}"
  }

  physical_component {
    type = "elb_physical"
    name = "ELB"
  }

  data_for_graph_node {
    type = "elb"
    name = "$output{LoadBalancerName}"
  }

  using = {
    "default" : "$input{using}"
  }

  inputs = "[]"

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (throughput{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "surge_queue_length" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "surge_queue_length" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (surge_queue_length{LoadBalancerName!='', tag_service!='', tag_namespace!='', quantile='1'})"
    }
  }

  gauge "connection_errors" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "connection_errors" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (connection_errors{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "unhealthy_hosts" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MAX"

    source prometheus "unhealthy_hosts" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (unhealthy_hosts{LoadBalancerName!='', tag_service!='', tag_namespace!='', quantile='1'})"
    }
  }

  gauge "status_1xx" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_1xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_1xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_2xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_2xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_3xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_3xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_4xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_5xx" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_5xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "lb_4xx" {
    index       = 11
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (lb_4xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "lb_5xx" {
    index       = 12
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (lb_5xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_min" {
    index       = 13
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (tag_service, tag_namespace, LoadBalancerName) (latency_min{LoadBalancerName!='', tag_service!='', tag_namespace!='', quantile='0'})"
    }
  }

  gauge "latency_max" {
    index       = 14
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by (tag_service, tag_namespace, LoadBalancerName) (latency_max{LoadBalancerName!='', tag_service!='', tag_namespace!='', quantile='1'})"
    }
  }

  gauge "latency_sum" {
    index       = 15
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "SUM"

    source prometheus "latency_sum" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (latency_sum{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_count" {
    index       = 16
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "latency_count" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (latency_count{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }
}

ingester aws_elb_endpoint module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  label {
    type = "service"
    name = "$output{tag_service}"
  }

  label {
    type = "namespace"
    name = "$output{tag_namespace}"
  }

  physical_address {
    type = "elb"
    name = "$output{LoadBalancerName}"
  }

  physical_component {
    type = "elb_physical"
    name = "ELB"
  }

  data_for_graph_node {
    type = "endpoint"
    name = "$output{LoadBalancerName}/"
  }

  using = {
    "default" : "$input{using}"
  }

  inputs = "[]"

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (throughput{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_1xx" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_1xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_1xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_2xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_2xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_3xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_3xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_4xx" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_4xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "status_5xx" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (status_5xx{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_min" {
    index       = 13
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (tag_service, tag_namespace, LoadBalancerName) (latency_min{LoadBalancerName!='', tag_service!='', tag_namespace!='', quantile='0'})"
    }
  }

  gauge "latency_max" {
    index       = 14
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by (tag_service, tag_namespace, LoadBalancerName) (latency_max{LoadBalancerName!='', tag_service!='', tag_namespace!='', quantile='1'})"
    }
  }

  gauge "latency_sum" {
    index       = 15
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "SUM"

    source prometheus "latency_sum" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (latency_sum{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_count" {
    index       = 16
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "latency_count" {
      query = "sum by (tag_service, tag_namespace, LoadBalancerName) (latency_count{LoadBalancerName!='', tag_service!='', tag_namespace!=''})"
    }
  }
}
