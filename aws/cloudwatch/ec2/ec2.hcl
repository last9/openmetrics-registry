scraper aws_ec2_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 20
  resolution = 60
  lag        = 120

  gauge "cpu" {
    source cloudwatch "cpu" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/EC2"
        metric_name = "CPUUtilization"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

  gauge "disk_read_ops" {
    source cloudwatch "disk_read_ops" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/EC2"
        metric_name = "EBSReadOps"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

  gauge "disk_write_ops" {
    source cloudwatch "disk_write_ops" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/EC2"
        metric_name = "EBSWriteOps"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

  gauge "network_in" {
    source cloudwatch "network_in" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/EC2"
        metric_name = "NetworkIn"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

  gauge "network_out" {
    source cloudwatch "network_out" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/EC2"
        metric_name = "NetworkOut"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

  gauge "status_check_failed" {
    source cloudwatch "status_check_failed" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/EC2"
        metric_name = "StatusCheckFailed"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

  gauge "cpu_credit_balance" {
    source cloudwatch "cpu_balance" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/EC2"
        metric_name = "CPUCreditBalance"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

  //   gauge "ebs_io_balance" {
  //     source cloudwatch "ebs_io_balance" {
  //       query {
  //         aggregator  = "Minimum"
  //         namespace   = "AWS/EC2"
  //         metric_name = "EBSIOBalance%"

  //         dimensions = {
  //           InstanceId = resources.each.InstanceId
  //         }
  //       }
  //     }
  //   }

  //   gauge "ebs_byte_balance" {
  //     source cloudwatch "ebs_byte_balance" {
  //       query {
  //         aggregator  = "Minimum"
  //         namespace   = "AWS/EC2"
  //         metric_name = "EBSByteBalance%"

  //         dimensions = {
  //           InstanceId = resources.each.InstanceId
  //         }
  //       }
  //     }
  //   }

  gauge "cpu_surplus_credits_charged" {
    source cloudwatch "cpu_surplus_credits_charged" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/EC2"
        metric_name = "CPUSurplusCreditsCharged"

        dimensions = {
          InstanceId = resources.each.InstanceId
        }
      }
    }
  }

}
