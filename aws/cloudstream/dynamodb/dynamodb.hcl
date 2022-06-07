scraper aws_dynamodb_table_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "rcu" {
    source promql "rcu" {
      query = "avg by (TableName) (amazonaws_com_AWS_DynamoDB_ConsumedReadCapacityUnits_sum{TableName=~'${join("|", resources.all.TableName)}'})"
    }
  }

  gauge "wcu" {
    source promql "wcu" {
      query = "avg by (TableName) (amazonaws_com_AWS_DynamoDB_ConsumedWriteCapacityUnits_sum{TableName=~'${join("|", resources.all.TableName)}'})"
    }
  }

  gauge "read_throttled" {
    source promql "read_throttled" {
      query = "avg by (TableName) (amazonaws_com_AWS_DynamoDB_ReadThrottleEvents_sum{TableName=~'${join("|", resources.all.TableName)}'})"
    }
  }

  gauge "write_throttled" {
    source promql "write_throttled" {
      query = "avg by (TableName) (amazonaws_com_AWS_DynamoDB_WriteThrottleEvents_sum{TableName=~'${join("|", resources.all.TableName)}'})"
    }
  }
}
