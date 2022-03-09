scraper aws_lambda_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "invocations" {
    source cloudwatch "invocations" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/Lambda"
        metric_name = "Invocations"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }
  }

  vector "latency" {
    dimension_label = "stat"

    source cloudwatch "min" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/Lambda"
        metric_name = "Duration"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }

    source cloudwatch "max" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Lambda"
        metric_name = "Duration"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }

    source cloudwatch "avg" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/Lambda"
        metric_name = "Duration"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }
  }

  gauge "concurrent_executions" {
    source cloudwatch "concurrent_executions" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/Lambda"
        metric_name = "ConcurrentExecutions"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }
  }

  gauge "concurrency_spillover" {
    source cloudwatch "concurrency_spillover" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/Lambda"
        metric_name = "ProvisionedConcurrencySpilloverInvocations"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }
  }

  gauge "throttles" {
    source cloudwatch "throttles" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/Lambda"
        metric_name = "Throttles"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }
  }

  gauge "errors" {
    source cloudwatch "errors" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/Lambda"
        metric_name = "Errors"

        dimensions = {
          FunctionName = resources.each.FunctionName
        }
      }
    }
  }
}