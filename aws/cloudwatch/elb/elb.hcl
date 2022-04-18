scraper aws_elb_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 5
  resolution = 60
  lag        = 120

  gauge "throughput" {
    source cloudwatch "throughput" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ELB"
        metric_name = "RequestCount"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }
  }

  gauge "surge_queue_length" {
    source cloudwatch "surge_queue_length" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ELB"
        metric_name = "SurgeQueueLength"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }
  }

  gauge "connection_errors" {
    source cloudwatch "connection_errors" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ELB"
        metric_name = "BackendConnectionErrors"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }
  }

  gauge "unhealthy_hosts" {
    source cloudwatch "unhealthy_hosts" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ELB"
        metric_name = "UnHealthyHostCount"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }
  }

  gauge "status_4xx" {
    source cloudwatch "status_4xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ELB"
        metric_name = "HTTPCode_Backend_4XX"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }
  }

  gauge "status_5xx" {
    source cloudwatch "status_5xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ELB"
        metric_name = "HTTPCode_Backend_5XX"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }
  }

  vector "latency" {
    dimension_label = "stat"

    source cloudwatch "count" {
      query {
        aggregator  = "SampleCount"
        namespace   = "AWS/ELB"
        metric_name = "Latency"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }

    source cloudwatch "sum" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ELB"
        metric_name = "Latency"

        dimensions = {
          LoadBalancerName = resources.each.LoadBalancerName
        }
      }
    }
  }
}
