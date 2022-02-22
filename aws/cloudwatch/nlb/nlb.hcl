scraper aws_nlb_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 20
  resolution = 60
  lag        = 120

  gauge "throughput" {
    source cloudwatch "throughput" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/NetworkELB"
        metric_name = "PeakBytesPerSecond"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "new_connections" {
    source cloudwatch "new_connections" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/NetworkELB"
        metric_name = "NewFlowCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "concurrent_connections" {
    source cloudwatch "concurrent_connections" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/NetworkELB"
        metric_name = "ActiveFlowCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }


  gauge "processed_bytes" {
    source cloudwatch "ProcessedBytes" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/NetworkELB"
        metric_name = "ProcessedBytes"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "consumed_lcus" {
    source cloudwatch "consumed_lcus" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/NetworkELB"
        metric_name = "ConsumedLCUs"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "tcp_client_reset_count" {
    source cloudwatch "tcp_client_reset_count" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/NetworkELB"
        metric_name = "TCP_Client_Reset_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "tcp_elb_reset_count" {
    source cloudwatch "tcp_elb_reset_count" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/NetworkELB"
        metric_name = "TCP_ELB_Reset_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "tcp_target_reset_count" {
    source cloudwatch "tcp_target_reset_count" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/NetworkELB"
        metric_name = "TCP_Target_Reset_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "target_tls_error" {
    source cloudwatch "target_tls_error" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/NetworkELB"
        metric_name = "TargetTLSNegotiationErrorCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
}
