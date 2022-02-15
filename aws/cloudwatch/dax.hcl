scraper aws_dax_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "throughput" {
    source cloudwatch "throughput" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DAX"
        metric_name = "TotalRequestCount"

        dimensions = {
          "ClusterId" = "$input{ClusterId}"
          "NodeId"    = "$input{NodeId}"
        }
      }
    }
  }

  gauge "errored" {
    source cloudwatch "errors" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DAX"
        metric_name = "ErrorRequestCount"

        dimensions = {
          "ClusterId" = "$input{ClusterId}"
          "NodeId"    = "$input{NodeId}"
        }
      }
    }
  }

  gauge "throttled" {
    source cloudwatch "throttled" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DAX"
        metric_name = "ThrottledRequestCount"

        dimensions = {
          "ClusterId" = "$input{ClusterId}"
          "NodeId"    = "$input{NodeId}"
        }
      }
    }
  }

  gauge "connections" {
    source cloudwatch "connections" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/DAX"
        metric_name = "ClientConnections"

        dimensions = {
          "ClusterId" = "$input{ClusterId}"
          "NodeId"    = "$input{NodeId}"
        }
      }
    }
  }

  gauge "query_miss" {
    source cloudwatch "memory" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DAX"
        metric_name = "QueryCacheMisses"

        dimensions = {
          "ClusterId" = "$input{ClusterId}"
          "NodeId"    = "$input{NodeId}"
        }
      }
    }
  }

  gauge "cache_memory" {
    source cloudwatch "memory" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/DAX"
        metric_name = "CacheMemoryUtilization"

        dimensions = {
          "ClusterId" = "$input{ClusterId}"
          "NodeId"    = "$input{NodeId}"
        }
      }
    }
  }

  gauge "cpu" {
    source cloudwatch "cpu" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/DAX"
        metric_name = "CPUUtilization"

        dimensions = {
          "ClusterId" = "$input{ClusterId}"
          "NodeId"    = "$input{NodeId}"
        }
      }
    }
  }
}
