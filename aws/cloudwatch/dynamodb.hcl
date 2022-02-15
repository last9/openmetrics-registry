scraper aws_dynamodb_table_operation_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "system_errors" {
    source cloudwatch "system_errors" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DynamoDB"
        metric_name = "SystemErrors"

        dimensions = {
          "TableName" = "$input{TableName}"
          "Operation" = "$input{Operation}"
        }
      }
    }
  }

  gauge "returned_items" {
    source cloudwatch "returned_items" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/DynamoDB"
        metric_name = "ReturnedItemCount"

        dimensions = {
          "TableName" = "$input{TableName}"
          "Operation" = "$input{Operation}"
        }
      }
    }
  }

  gauge "throttled" {
    source cloudwatch "latency_update" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DynamoDB"
        metric_name = "ThrottledRequests"

        dimensions = {
          "TableName" = "$input{TableName}"
          "Operation" = "$input{Operation}"
        }
      }
    }
  }

  gauge "latency" {
    source cloudwatch "latency" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/DynamoDB"
        metric_name = "SuccessfulRequestLatency"

        dimensions = {
          "TableName" = "$input{TableName}"
          "Operation" = "$input{Operation}"
        }
      }
    }
  }
}

scraper aws_dynamodb_table_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "rcu" {
    source cloudwatch "rcu" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DynamoDB"
        metric_name = "ConsumedReadCapacityUnits"

        dimensions = {
          "TableName" = "$input{TableName}"
        }
      }
    }
  }

  gauge "wcu" {
    source cloudwatch "wcu" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DynamoDB"
        metric_name = "ConsumedWriteCapacityUnits"

        dimensions = {
          "TableName" = "$input{TableName}"
        }
      }
    }
  }

  gauge "read_throttled" {
    source cloudwatch "read_throttled" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DynamoDB"
        metric_name = "ReadThrottledEvents"

        dimensions = {
          "TableName" = "$input{TableName}"
        }
      }
    }
  }

  gauge "write_throttled" {
    source cloudwatch "write_throttled" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/DynamoDB"
        metric_name = "WriteThrottledEvents"

        dimensions = {
          "TableName" = "$input{TableName}"
        }
      }
    }
  }
}
