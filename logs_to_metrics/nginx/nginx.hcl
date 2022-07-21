ingester logs_to_metrics_nginx module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  using = {
    "default" : "$input{using}"
  }

  inputs = "$input{inputs}"

  label {
    type = "service"
    name = "$output{tag_service}"
  }

  label {
    type = "namespace"
    name = <<-EOF
    split(":", "$output{domain}")[0]
    EOF
  }

  physical_component {
    type = "parsed_nginx"
    name = "parsed_nginx"
  }

  data_for_graph_node {
    type = "parsed_endpoint"
    name = "$output{domain}$output{uri}"
  }

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (domain, uri, tag_service) (throughput{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != ''})"
    }
  }

  gauge "bytes_in" {
    index       = 2
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (domain, uri, tag_service) (bytes_in{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != ''})"
    }
  }

  gauge "bytes_out" {
    index       = 3
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (domain, uri, tag_service) (bytes_out{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != ''})"
    }
  }

  gauge "status_1xx" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_1xx" {
      query = "sum by (domain, uri, tag_service) (status_1xx{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', code != ''})"
    }
  }

  gauge "status_2xx" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      query = "sum by (domain, uri, tag_service) (status_2xx{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', code != ''})"
    }
  }


  gauge "status_3xx" {
    index       = 6
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      query = "sum by (domain, uri, tag_service, code) (status_3xx{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', code != ''})"
    }
  }

  gauge "status_4xx" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      query = "sum by (domain, uri, tag_service, code) (status_4xx{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', code != ''})"
    }
  }

  gauge "status_5xx" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      query = "sum by (domain, uri, tag_service, code) (status_5xx{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', code != ''})"
    }
  }


  gauge "latency_min" {
    index       = 9
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MIN"

    source prometheus "latency_min" {
      query = "histogram_quantile(0, rate(latency_histo{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', le != ''}[1m]*60))"
    }
  }

  gauge "latency_max" {
    index       = 11
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_max" {
      query = "histogram_quantile(1, rate(latency_histo{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', le != ''}[1m]*60))"
    }
  }

  gauge "latency_p50" {
    index       = 12
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_p50" {
      query = "histogram_quantile(0.50, rate(latency_histo{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', le != ''}[1m]*60))"
    }
  }

  gauge "latency_p90" {
    index       = 13
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "MAX"

    source prometheus "latency_p90" {
      query = "histogram_quantile(0.90, rate(latency_histo{tag_service != '', tag_namespace = 'nginx',  domain != '', uri != '', le != ''}[1m]*60))"
    }
  }
}
