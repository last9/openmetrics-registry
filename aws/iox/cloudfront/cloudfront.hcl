ingester aws_cloudfront module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  using = {
    default = "$input{using}"
  }

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
    type = "cloudfront_distribution"
    name = "CloudFront Distribution"
  }

  data_for_graph_node {
    type = "cloudfront_distribution"
    name = "$output{DistributionId}"
  }

  gauge "status_5xx" {
    index       = 5
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "MAX"
    source prometheus "connections" {
      query = "sum by (DistributionId, tag_namespace, tag_service) (status_5xx{DistributionId!='', tag_service!='', tag_namespace!='', tag_component='cloudfront_cloudwatch'})"
    }
  }
  gauge "status_4xx" {
    index       = 4
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "SUM"
    source prometheus "status_4xx" {
      query = "sum by (DistributionId, tag_namespace, tag_service) (status_4xx{DistributionId!='', tag_service!='', tag_namespace!='', tag_component='cloudfront_cloudwatch'})"
    }
  }
  gauge "bytes_out" {
    index       = 3
    input_unit  = "bytes"
    output_unit = "Bps"
    aggregator  = "SUM"
    source prometheus "bytes_out" {
      query = "sum by (DistributionId, tag_namespace, tag_service) (bytes_out{DistributionId!='', tag_service!='', tag_namespace!='', tag_component='cloudfront_cloudwatch'})"
    }
  }
  gauge "bytes_in" {
    index       = 2
    input_unit  = "bytes"
    output_unit = "Bps"
    aggregator  = "SUM"
    source prometheus "bytes_in" {
      query = "sum by (DistributionId, tag_namespace, tag_service) (bytes_in{DistributionId!='', tag_service!='', tag_namespace!='', tag_component='cloudfront_cloudwatch'})"
    }
  }
  gauge "throughput" {
    index       = 1
    input_unit  = "count"
    output_unit = "rpm"
    aggregator  = "SUM"
    source prometheus "throughput" {
      query = "sum by (DistributionId, tag_namespace, tag_service) (throughput{DistributionId!='', tag_service!='', tag_namespace!='', tag_component='cloudfront_cloudwatch'})"
    }
  }
}

