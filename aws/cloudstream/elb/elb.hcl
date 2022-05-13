scraper aws_elb_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "throughput" {
    source promql "throughput" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_RequestCount_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "surge_queue_length" {
    source promql "surge_queue_length" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_SurgeQueueLength{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone='', quantile='1'})"
    }
  }

  gauge "connection_errors" {
    source promql "connection_errors" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_BackendConnectionErrors_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "unhealthy_hosts" {
    source promql "unhealthy_hosts" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_UnHealthyHostCount{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone='', quantile='1'})"
    }
  }

  gauge "status_1xx" {
    source promql "status_1xx" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_Backend_1XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "status_2xx" {
    source promql "status_2xx" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_Backend_2XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "status_3xx" {
    source promql "status_3xx" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_Backend_3XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "status_4xx" {
    source promql "status_4xx" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_Backend_4XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "status_5xx" {
    source promql "status_5xx" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_Backend_5XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "lb_4xx" {
    source promql "status_4xx" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_ELB_4XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "lb_5xx" {
    source promql "status_5xx" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_ELB_5XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "latency_min" {
    source promql "latency_min" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency{LoadBalancerName='${resources.each.LoadBalancerName}', quantile='0', AvailabilityZone=''})"
    }
  }

  gauge "latency_max" {
    source promql "latency_max" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency{LoadBalancerName='${resources.each.LoadBalancerName}', quantile='1', AvailabilityZone=''})"
    }
  }

  gauge "latency_sum" {
    source promql "latency_sum" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "latency_count" {
    source promql "latency_count" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency_count{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }
}
