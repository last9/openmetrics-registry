scraper aws_alb_cloudwatch module {
  frequency  = 10
  lookback   = 600
  timeout    = 5
  resolution = 60
  lag        = 120

  gauge "throughput" {
    source cloudwatch "throughput" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "RequestCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  vector "latency" {
    dimension_label = "latency"

    source cloudwatch "p50" {
      query {
        aggregator  = "p50"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "p75" {
      query {
        aggregator  = "p75"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "p90" {
      query {
        aggregator  = "p90"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "p99" {
      query {
        aggregator  = "p99"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "p100" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  vector "failed_requests" {
    dimension_label = "status_code"

    source cloudwatch "500" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_500_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "502" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_502_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "503" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_503_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "504" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_504_Count"

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
        namespace   = "AWS/ApplicationELB"
        metric_name = "NewConnectionCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "rejected_connections" {
    source cloudwatch "rejected_connections" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "RejectedConnectionCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "processed_bytes" {
    source cloudwatch "processed_bytes" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "ProcessedBytes"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

  gauge "lcu" {
    source cloudwatch "lcu" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "ConsumedLCUs"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }

}

