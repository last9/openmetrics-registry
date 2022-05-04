scraper aws_elb_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "throughput" {
    source prometheus "throughput" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_RequestCount_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "surge_queue_length" {
    source prometheus "surge_queue_length" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_SurgeQueueLength{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone='', quantile='1'})"
    }
  }

  gauge "connection_errors" {
    source prometheus "connection_errors" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_BackendConnectionErrors_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "unhealthy_hosts" {
    source prometheus "unhealthy_hosts" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_UnHealthyHostCount{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone='', quantile='1'})"
    }
  }

  gauge "status_4xx" {
    source prometheus "lb_400" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_Backend_4XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "status_5xx" {
    source prometheus "lb_500" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_HTTPCode_Backend_5XX_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

  gauge "latency_min" {
    source prometheus "latency_min" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency{LoadBalancerName='${resources.each.LoadBalancerName}', quantile='0', AvailabilityZone=''})"
    }
  }

  gauge "latency_max" {
    source prometheus "latency_max" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency{LoadBalancerName='${resources.each.LoadBalancerName}', quantile='1', AvailabilityZone=''})"
    }
  }

  gauge "latency_avg" {
    source prometheus "latency_avg" {
      query = "sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency_sum{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''}) / sum by (LoadBalancerName) (amazonaws_com_AWS_ELB_Latency_count{LoadBalancerName='${resources.each.LoadBalancerName}', AvailabilityZone=''})"
    }
  }

}
