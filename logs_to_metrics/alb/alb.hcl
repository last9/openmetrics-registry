ingester logs_to_metrics_alb module {
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
    type = "alb"
    name = "alb"
  }

  data_for_graph_node {
    type = "endpoint"
    name = "$output{domain}$output{uri}"
  }

  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (domain, uri, tag_service) (throughput{tag_service != '', domain != '', uri != ''})"
    }
  }

  gauge "bytes_in" {
    index       = 3
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (domain, uri, tag_service) (bytes_in{tag_service != '', domain != '', uri != ''})"
    }
  }

  gauge "bytes_out" {
    index       = 4
    input_unit  = "bytes"
    output_unit = "bytes"
    aggregator  = "SUM"

    source prometheus "throughput" {
      query = "sum by (domain, uri, tag_service) (bytes_out{tag_service != '', domain != '', uri != ''})"
    }
  }

  status_histo "status_1xx" {
    index       = 1
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_1xx" {
      histo_column = "response_code"
      query        = "sum by (domain, uri, tag_service, code) (status_1xx{tag_service != '', domain != '', uri != '', code != ''})"
    }
  }

  status_histo "status_2xx" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_2xx" {
      histo_column = "code"
      query        = "sum by (domain, uri, tag_service, code) (status_2xx{tag_service != '', domain != '', uri != '', code != ''})"
    }
  }

  status_histo "status_3xx" {
    index       = 3
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_3xx" {
      histo_column = "code"
      query        = "sum by (domain, uri, tag_service, code) (status_3xx{tag_service != '', domain != '', uri != '', code != ''})"
    }
  }

  status_histo "status_4xx" {
    index       = 4
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_4xx" {
      histo_column = "code"
      query        = "sum by (domain, uri, tag_service, code) (status_4xx{tag_service != '', domain != '', uri != '', code != ''})"
    }
  }

  status_histo "status_5xx" {
    index       = 5
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_5xx" {
      histo_column = "code"
      query        = "sum by (domain, uri, tag_service, code) (status_5xx{tag_service != '', domain != '', uri != '', code != ''})"
    }
  }

  latency_histo "latency_histo" {
    index       = 6
    input_unit  = "ms"
    output_unit = "ms"
    aggregator  = "PERCENTILE"

    source prometheus "latency" {
      query = "sum by (domain, uri, tag_service, le) (latency_histo{tag_service != '', domain != '', uri != '', le != ''})"
    }
  }
}
