scraper aws_alb_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 20
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


  gauge "latency_min" {
    source cloudwatch "latency_min" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "latency_max" {
    source cloudwatch "latency_max" {
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
  gauge "latency_sum" {
    source cloudwatch "latency_sum" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "latency_count" {
    source cloudwatch "latency_count" {
      query {
        aggregator  = "SampleCount"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "status_2xx" {
    source cloudwatch "status_2xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_2XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "status_3xx" {
    source cloudwatch "status_3xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_3XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "status_4xx" {
    source cloudwatch "status_4xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_4XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "status_5xx" {
    source cloudwatch "status_5xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_5XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "lb_4xx" {
    source cloudwatch "lb_4xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_4XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }
  }
  gauge "lb_5xx" {
    source cloudwatch "lb_5xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_5XX_Count"

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

scraper aws_alb_target_group_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 20
  resolution = 60
  lag        = 120

  gauge "target_connnection_error_count" {
    source cloudwatch "target_connnection_error_count" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetConnectionErrorCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }


  gauge "healthy_host_count" {
    source cloudwatch "healthy_host_count" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HealthyHostCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }

  gauge "unhealthy_host_count" {
    source cloudwatch "unhealthy_host_count" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "UnhealthyHostCount"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }

  gauge "throughput" {
    source cloudwatch "throughput" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "RequestCountPerTarget"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }

  gauge "status_4xx" {
    source cloudwatch "status_4xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_4XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }

  gauge "status_5xx" {
    source cloudwatch "status_5xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_5XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }


  gauge "latency_min" {
    source cloudwatch "latency_min" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }
  gauge "latency_max" {
    source cloudwatch "latency_max" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }
  gauge "latency_sum" {
    source cloudwatch "latency_sum" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }
  gauge "latency_count" {
    source cloudwatch "latency_count" {
      query {
        aggregator  = "SampleCount"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
          TargetGroup  = resources.each.TargetGroup
        }
      }
    }
  }
}
