ingester aws_ec2 module {
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
    type = "ec2_instance_logical"
    name = "$output{InstanceId}"
  }

  gauge "cpu" {
    index       = 1
    input_unit  = "percent"
    output_unit = "percent"
    aggregator  = "AVG"

    source prometheus "cpu" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (cpu{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }

  gauge "cpu_credit_balance" {
    index       = 2
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "cpu_balance" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (cpu_balance{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }

  gauge "network_in" {
    index       = 5
    input_unit  = "bytes"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "network_in" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (network_in{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }

  gauge "network_out" {
    index       = 6
    input_unit  = "bytes"
    output_unit = "Bps"
    aggregator  = "SUM"

    source prometheus "network_out" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (network_out{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }

  gauge "status_check_failed" {
    index       = 7
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "status_check_failed" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (status_check_failed{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }

  gauge "disk_read_ops" {
    index       = 8
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "disk_read_ops" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (disk_read_ops{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }

  gauge "disk_write_ops" {
    index       = 9
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "MIN"

    source prometheus "disk_write_ops" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (disk_write_ops{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }

  gauge "cpu_surplus_credits_charged" {
    index       = 11
    input_unit  = "count"
    output_unit = "count"
    aggregator  = "SUM"

    source prometheus "cpu_surplus_credits_charged" {
      query = "sum by (InstanceId, tag_service, tag_namespace) (cpu_surplus_credits_charged{tag_service!='', tag_namespace!='', InstanceId!='', tag_component='ec2_cloudwatch'})"

    }
  }
}
