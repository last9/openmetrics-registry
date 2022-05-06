scraper aws_alb_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "throughput" {
    source prometheus "throughput" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_RequestCount_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "new_connections" {
    source prometheus "new_connections" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_NewConnectionCount_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "rejected_connections" {
    source prometheus "rejected_connections" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_RejectedConnectionCount_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "processed_bytes" {
    source prometheus "processed_bytes" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_ProcessedBytes_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "lcu" {
    source prometheus "lcu" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_ConsumedLCUs_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_2xx" {
    source prometheus "status_2xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_2XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_3xx" {
    source prometheus "status_3xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_3XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_4xx" {
    source prometheus "status_4xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_4XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "status_5xx" {
    source prometheus "status_5xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_5XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "lb_4xx" {
    source prometheus "lb_4xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_ELB_4XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "lb_5xx" {
    source prometheus "lb_5xx" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_HTTPCode_ELB_5XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "latency_min" {
    source prometheus "latency_min" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'$input{LoadBalancer}', quantile='0',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "latency_max" {
    source prometheus "latency_max" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'$input{LoadBalancer}', quantile='1',AvailabilityZone='',TargetGroup=''})"
    }
  }

  gauge "latency_avg" {
    source prometheus "latency_avg" {
      query = "sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_sum{LoadBalancer=~'$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''}) / sum by (LoadBalancer) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_count{LoadBalancer='$input{LoadBalancer}',AvailabilityZone='',TargetGroup=''})"
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
    source prometheus "throughput" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_RequestCount_sum{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_2xx" {
    source prometheus "status_200" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_2XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_3xx" {
    source prometheus "status_300" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_3XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_4xx" {
    source prometheus "status_400" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_4XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "status_5xx" {
    source prometheus "status_500" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_HTTPCode_Target_5XX_Count_sum{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }

  gauge "latency_min" {
    source prometheus "lcu" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', quantile='0', AvailabilityZone=''})"
    }
  }

  gauge "latency_max" {
    source prometheus "lcu" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', quantile='1', AvailabilityZone=''})"
    }
  }

  gauge "latency_avg" {
    source prometheus "lcu" {
      query = "sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_sum{LoadBalancer=~'$input{LoadBalancer}', TargetGroup=~'.+', AvailabilityZone=''}) / sum by (LoadBalancer, TargetGroup) (amazonaws_com_AWS_ApplicationELB_TargetResponseTime_count{LoadBalancer='$input{LoadBalancer}', TargetGroup=~'.+', AvailabilityZone=''})"
    }
  }
}
