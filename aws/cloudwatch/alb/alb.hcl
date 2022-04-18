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

  vector "latency" {
    dimension_label = "stat"

    source cloudwatch "count" {
      query {
        aggregator  = "SampleCount"
        namespace   = "AWS/ApplicationELB"
        metric_name = "TargetResponseTime"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "sum" {
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

  vector "response" {
    // Ideally we should record all individual status codes in this vector,
    // but becasue aws cloudwatch does not provide such granularity, we can
    // only differentiate between status code classes and their origin (lb or target)
    dimension_label = "code"

    source cloudwatch "2xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_2XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    // 3xx originated at lb itself and returned to client, due to some
    // rule at lb or target is not reachable.
    source cloudwatch "3xx_lb" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_3XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    // 3xx retuned from target
    source cloudwatch "3xx_target" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_3XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "4xx_lb" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_4XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "4xx_target" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_Target_4XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "5xx_lb" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApplicationELB"
        metric_name = "HTTPCode_ELB_5XX_Count"

        dimensions = {
          LoadBalancer = resources.each.LoadBalancer
        }
      }
    }

    source cloudwatch "5xx_target" {
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


  vector "latency" {
    dimension_label = "stat"

    source cloudwatch "count" {
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

    source cloudwatch "sum" {
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
}
