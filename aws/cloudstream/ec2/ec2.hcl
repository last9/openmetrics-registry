scraper aws_ec2_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "cpu" {
    source promql "cpu" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_CPUUtilization_sum{InstanceId=~'${join("|", resources.all.InstanceId)}'}) / sum by (InstanceId) (amazonaws_com_AWS_EC2_CPUUtilization_count{InstanceId=~'${join("|", resources.all.InstanceId)}'})"
    }
  }

  gauge "cpu_credit_balance" {
    source promql "cpu_balance" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_CPUCreditBalance{InstanceId=~'${join("|", resources.all.InstanceId)}', quantile='0'})"
    }
  }

  gauge "network_in" {
    source promql "network_in" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_NetworkIn_sum{InstanceId=~'${join("|", resources.all.InstanceId)}'})"
    }
  }

  gauge "network_out" {
    source promql "network_out" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_NetworkOut_sum{InstanceId=~'${join("|", resources.all.InstanceId)}'})"

    }
  }

  gauge "status_check_failed" {
    source promql "status_check_failed" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_StatusCheckFailed_sum{InstanceId=~'${join("|", resources.all.InstanceId)}'})"
    }
  }

  gauge "ebs_io_balance" {
    source promql "ebs_io_balance" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_EBSIOBalance_{InstanceId=~'${join("|", resources.all.InstanceId)}', quantile='0'})"

    }
  }

  gauge "ebs_byte_balance" {
    source promql "ebs_byte_balance" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_EBSByteBalance_{InstanceId=~'${join("|", resources.all.InstanceId)}', quantile='0'})"
    }
  }

  gauge "cpu_surplus_credits_charged" {
    source promql "cpu_surplus_credits_charged" {
      query = "sum by (InstanceId) (amazonaws_com_AWS_EC2_CPUSurplusCreditsCharged_sum{InstanceId=~'${join("|", resources.all.InstanceId)}'})"
    }
  }
}

