scraper aws_sqs_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "sent" {
    source cloudwatch "sent" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/SQS"
        metric_name = "NumberOfMessagesSent"

        dimensions = {
          "QueueName" = resources.each.QueueName
        }
      }
    }
  }

  gauge "received" {
    source cloudwatch "received" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/SQS"
        metric_name = "NumberOfMessagesReceived"

        dimensions = {
          "QueueName" = resources.each.QueueName
        }
      }
    }
  }

  gauge "visible" {
    source cloudwatch "visible" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/SQS"
        metric_name = "ApproximateNumberOfMessagesVisible"

        dimensions = {
          "QueueName" = resources.each.QueueName
        }
      }
    }
  }

  gauge "empty_receives" {
    source cloudwatch "empty_receives" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/SQS"
        metric_name = "NumberOfEmptyReceives"

        dimensions = {
          "QueueName" = resources.each.QueueName
        }
      }
    }
  }

  gauge "deleted" {
    source cloudwatch "deleted" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/SQS"
        metric_name = "NumberOfMessagesDeleted"

        dimensions = {
          "QueueName" = resources.each.QueueName
        }
      }
    }
  }

  gauge "delayed" {
    source cloudwatch "delayed" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/SQS"
        metric_name = "ApproximateNumberOfMessagesDelayed"

        dimensions = {
          "QueueName" = resources.each.QueueName
        }
      }
    }
  }

  gauge "oldest" {
    source cloudwatch "oldest" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/SQS"
        metric_name = "ApproximateAgeOfOldestMessage"

        dimensions = {
          "QueueName" = resources.each.QueueName
        }
      }
    }
  }
}
