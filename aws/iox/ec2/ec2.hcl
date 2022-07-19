ingester aws_ec2_cloudstream module {
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
    type = "namespace"
    name = "$output{tag_namespace}"
  }

  label {
    type = "service"
    name = "$output{tag_service}"
  }

  physical_component {
    type = "ec2_instance"
    name = "EC2 Instance"
  }

  data_for_graph_node {
    type = "ec2_instance"
    name = "$output{InstanceId}"
  }

  gauge "cpu" {
    index       = 1
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "cpu" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (cpu{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }

  gauge "cpu_credit_balance" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "cpu_balance" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (cpu_balance{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }

  gauge "network_in" {
    index       = 5
    input_unit  = "bytes"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "network_in" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (network_in{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }

  gauge "network_out" {
    index       = 6
    input_unit  = "bytes"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "network_out" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (network_out{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }

  gauge "status_check_failed" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_check_failed" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (status_check_failed{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }

  gauge "ebs_io_balance" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "ebs_io_balance" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (ebs_io_balance{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }

  gauge "ebs_byte_balance" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "ebs_byte_balance" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (ebs_byte_balance{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }

  gauge "cpu_surplus_credits_charged" {
    index       = 11
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "cpu_surplus_credits_charged" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (cpu_surplus_credits_charged{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudstream'})"

    }
  }
}

