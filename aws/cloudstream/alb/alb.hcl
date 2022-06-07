scraper aws_alb_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "throughput" {
    source promql "throughput" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_RequestCount_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "new_connections" {
    source promql "new_connections" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_NewConnectionCount_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "rejected_connections" {
    source promql "rejected_connections" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_RejectedConnectionCount_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "processed_bytes" {
    source promql "processed_bytes" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_ProcessedBytes_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "lcu" {
    source promql "lcu" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_ConsumedLCUs_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_2xx" {
    source promql "status_2xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_2XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_3xx" {
    source promql "status_3xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_3XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_4xx" {
    source promql "status_4xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_4XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_5xx" {
    source promql "status_5xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_5XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "lb_4xx" {
    source promql "lb_4xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_ELB_4XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "lb_5xx" {
    source promql "lb_5xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_ELB_5XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "latency_min" {
    source promql "latency_min" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', quantile='0',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "latency_max" {
    source promql "latency_max" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', quantile='1',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "latency_sum" {
    source promql "latency_sum" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "latency_count" {
    source promql "latency_count" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_count{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}',AvailabilityZone='',TargetGroup=''})"
    }
  }
}

scraper aws_alb_tg_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "throughput" {
    source promql "throughput" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_RequestCount_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_2xx" {
    source promql "status_2xx" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_2XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_3xx" {
    source promql "status_3xx" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_3XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_4xx" {
    source promql "status_4xx" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_4XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_5xx" {
    source promql "status_5xx" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_5XX_Count_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "latency_min" {
    source promql "latency_min" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', quantile='0', AvailabilityZone=''})"
    }
  }

  gauge "latency_max" {
    source promql "latency_max" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', quantile='1', AvailabilityZone=''})"
    }
  }

  gauge "latency_sum" {
    source promql "latency_sum" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_sum{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "latency_count" {
    source promql "latency_count" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_count{LoadBalancer=~'${join("|", resources.all.LoadBalancer)}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }
}
