scraper aws_rds_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 20
  resolution = 60
  lag        = 120

  gauge "connections" {
    source cloudwatch "connections" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/RDS"
        metric_name = "DatabaseConnections"

        dimensions = {
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "write_iops" {
    source cloudwatch "write_iops" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "WriteIOPS"

        dimensions = {
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "read_iops" {
    source cloudwatch "read_iops" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "ReadIOPS"

        dimensions = {
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
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
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "write_latency" {
    source cloudwatch "wrtie_latency" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "WriteLatency"

        dimensions = {
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "network_in" {
    source cloudwatch "network_in" {
      query {
        aggregator  = "Average"
        namespace   = "AWS/RDS"
        metric_name = "NetworkReceiveThroughput"

        dimensions = {
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
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
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
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
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "free_space" {
    source cloudwatch "free_space" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/RDS"
        metric_name = "FreeStorageSpace"

        dimensions = {
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
        }
      }
    }
  }

  gauge "replica_lag" {
    source cloudwatch "replica_lag" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/RDS"
        metric_name = "ReplicaLag"

        dimensions = {
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
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
          DBInstanceIdentifier = resources.each.DBInstanceIdentifier
        }
      }
    }
  }
}
