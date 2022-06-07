scraper aws_dax_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60



  gauge "throughput" {

    source promql "throughput" {
      query = "sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_TotalRequestCount_sum{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''})"
    }
  }


  gauge "errors" {

    source promql "errors" {
      query = "sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_ErrorRequestCount_sum{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''})"

    }
  }

  gauge "throttled" {

    source promql "throttled" {
      query = "sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_ThrottledRequestCount_sum{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''})"

    }
  }

  gauge "connections" {

    source promql "connections" {
      query = "sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_ClientConnections{quantile='1',ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''})"

    }
  }

  gauge "query_miss" {

    source promql "query_miss" {
      query = "sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_QueryCacheMisses_sum{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''})"

    }
  }

  gauge "cache_memory" {

    source promql "memory" {
      query = "sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_CacheMemoryUtilization_sum{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''}) / sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_CacheMemoryUtilization_count{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''})"

    }
  }

  gauge "cpu" {

    source promql "cpu" {
      query = "sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_CPUUtilization_sum{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''}) / sum by (ClusterId, NodeId) (amazonaws_com_AWS_DAX_CPUUtilization_count{ClusterId=~'${join("|", resources.all.ClusterId)}',NodeId!=''})"

    }
  }
}
