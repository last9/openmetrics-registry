scraper aws_aurora_instance_logical_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "connections" {
    source cloudwatch "connections" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/RDS"
        metric_name = "DatabaseConnections"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "read_throughput" {
    source cloudwatch "read_throughput" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "ReadThroughput"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }


  gauge "read_latency" {
    source cloudwatch "read_latency" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "ReadLatency"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "write_throughput" {
    source cloudwatch "write_throughput" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "WriteThroughput"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "write_latency" {
    source cloudwatch "write_latency" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "WriteLatency"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "update_throughput" {
    source cloudwatch "update_throughput" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "UpdateThroughput"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "update_latency" {
    source cloudwatch "update_latency" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "UpdateLatency"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "delete_throughput" {
    source cloudwatch "delete_throughput" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "DeleteThroughput"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "delete_latency" {
    source cloudwatch "delete_latency" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "DeleteLatency"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "deadlocks" {
    source cloudwatch "deadlocks" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/RDS"
        metric_name = "Deadlocks"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }
}

scraper aws_aurora_instance_physical_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "network_in" {
    source cloudwatch "network_in" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "NetworkReceiveThroughput"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "network_out" {
    source cloudwatch "network_out" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "NetworkTransmitThroughput"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "cpu" {
    source cloudwatch "cpu" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "CPUUtilization"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "free_space" {
    source cloudwatch "free_space" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/RDS"
        metric_name = "FreeLocalStorage"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "replica_lag" {
    source cloudwatch "replica_lag" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/RDS"
        metric_name = "AuroraReplicaLag"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "queue_depth" {
    source cloudwatch "queue_depth" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/RDS"
        metric_name = "DiskQueueDepth"

        dimensions = {
          "DBInstanceIdentifier" = resources.each.DBInstanceIdentifier
        }
      }
    }
  }
}
