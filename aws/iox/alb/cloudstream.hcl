ingester aws_alb_cloudstream module {
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
    type = "alb_cloudstream"
    name = "ALB"
  }

  data_for_graph_node {
    type = "alb_cloudstream_logical"
    name = "$output{LoadBalancer}_logical"
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
    input_unit  = "s"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "min by (tag_service, tag_namespace, LoadBalancer) (latency_min{LoadBalancer!='', AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_max" {
    index       = 14
    input_unit  = "s"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "max by (tag_service, tag_namespace, LoadBalancer) (latency_max{LoadBalancer!='', AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

  gauge "latency_avg" {
    index       = 15
    input_unit  = "s"
    output_unit = "ms"
    aggregator  = "AVG"
    source prometheus "latency_avg" {
      query = "sum by (tag_service, tag_namespace, LoadBalancer) (latency_sum{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''}) / sum by (tag_service, tag_namespace, LoadBalancer) (latency_count{LoadBalancer!='',AvailabilityZone='',TargetGroup='', tag_service!='', tag_namespace!=''})"
    }
  }

}
