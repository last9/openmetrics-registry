scraper aws_aurora_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "connections" {
    source promql "connections" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_DatabaseConnections{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "read_throughput" {
    source promql "read_throughput" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_ReadThroughput{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "write_throughput" {
    source promql "write_throughput" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_WriteThroughput{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "update_throughput" {
    source promql "update_throughput" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_UpdateThroughput{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "delete_throughput" {
    source promql "delete_throughput" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_DeleteThroughput{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "read_latency" {
    source promql "read_latency" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_ReadLatency{quantile='1', DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_ReadLatency_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "write_latency" {
    source promql "write_latency" {
      query = "sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_WriteLatency{quantile='1', DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_WriteLatency_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "update_latency" {
    source promql "update_latency" {
      query = "sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_UpdateLatency{quantile='1', DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_WriteLatency_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "delete_latency" {
    source promql "delete_latency" {
      query = "sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_DeleteLatency{quantile='1', DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_WriteLatency_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "cpu" {
    source promql "cpu" {
      query = "avg by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_CPUUtilization{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_CPUUtilization_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "deadlocks" {
    source promql "deadlocks" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_Deadlocks{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='0'})"
    }
  }

  gauge "free_space" {
    source promql "free_space" {
      query = "min by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_FreeLocalStorage{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='0'})"
    }
  }

  gauge "replica_lag" {
    source promql "replica_lag" {
      query = "max by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_AuroraReplicaLag{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "queue_depth" {
    source promql "replica_lag" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_DiskQueueDepth{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "network_in" {
    source promql "network_in" {
      query = "avg by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkReceiveThroughput_sum{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkReceiveThroughput_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "network_out" {
    source promql "network_out" {
      query = "avg by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkTransmitThroughput_sum{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkTransmitThroughput_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }
}
