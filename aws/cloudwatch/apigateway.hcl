scraper aws_apigateway_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "throughput" {
    source cloudwatch "througput" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApiGateway"
        metric_name = "Count"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }
  }

  vector latency {
    dimension_label = "latency"

    source cloudwatch "p50" {
      query {
        aggregator  = "p50"
        namespace   = "AWS/ApiGateway"
        metric_name = "Latency"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }
    source cloudwatch "p75" {
      query {
        aggregator  = "p75"
        namespace   = "AWS/ApiGateway"
        metric_name = "Latency"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }

    source cloudwatch "p90" {
      query {
        aggregator  = "p90"
        namespace   = "AWS/ApiGateway"
        metric_name = "Latency"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }

    source cloudwatch "p99" {
      query {
        aggregator  = "p99"
        namespace   = "AWS/ApiGateway"
        metric_name = "Latency"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }

    source cloudwatch "p100" {
      query {
        aggregator  = "p100"
        namespace   = "AWS/ApiGateway"
        metric_name = "Latency"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }
  }

  gauge "integration_latency" {
    source cloudwatch "integration_latency" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/ApiGateway"
        metric_name = "IntegrationLatency"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }
  }

  // The Average statistic represents the cache hit rate, namely, the total count of the cache hits divided by
  // the total number of requests during the period
  gauge "cache_miss" {
    source cloudwatch "cache_miss" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApiGateway"
        metric_name = "CacheMissCount"

        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }
  }

  // The Average statistic represents the 4XXError error rate, namely, the total count of the 4XXError errors divided by
  // the total number of requests during the period.
  gauge status_4xx {
    source cloudwatch "status_400" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApiGateway"
        metric_name = "4XXError"
        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }
  }

  // The Average statistic represents the 5XXError error rate, namely, the total count of the 5XXError errors divided by
  // the total number of requests during the period.
  gauge status_5xx {
    source cloudwatch "status_500" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ApiGateway"
        metric_name = "5XXError"
        dimensions = {
          ApiName = resources.each.ApiName
          Stage   = resources.each.Stage
        }
      }
    }
  }

}