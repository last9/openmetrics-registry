scraper aws_rds_cloudstream module {
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

  gauge "ebs_io_balance" {
    source promql "ebs_io_balance" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_EBSIOBalance_{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='0'})"
    }
  }

  gauge "ebs_byte_balance" {
    source promql "ebs_byte_balance" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_EBSByteBalance_{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='0'})"
    }
  }

  gauge "burst_balance" {
    source promql "burst_balance" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_BurstBalance{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='0'})"
    }
  }

  gauge "read_latency_sum" {
    source promql "read_latency_sum" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_ReadLatency_sum{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "read_latency_count" {
    source promql "read_latency_count" {
      query = "sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_ReadLatency_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "write_latency_sum" {
    source promql "write_latency_sum" {
      query = "sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_WriteLatency_sum{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "write_latency_count" {
    source promql "write_latency_count" {
      query = "sum by (DBInstanceIdentifier)  (amazonaws_com_AWS_RDS_WriteLatency_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "cpu_sum" {
    source promql "cpu_sum" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_CPUUtilization_sum{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "cpu_count" {
    source promql "cpu_count" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_CPUUtilization_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "cpu_balance" {
    source promql "cpu_balance" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_CPUCreditBalance{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='0'})"
    }
  }

  gauge "free_space" {
    source promql "free_space" {
      query = "min by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_FreeStorageSpace{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='0'})"
    }
  }

  gauge "replica_lag" {
    source promql "replica_lag" {
      query = "max by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_ReplicaLag{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "queue_depth" {
    source promql "replica_lag" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_DiskQueueDepth{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}', quantile='1'})"
    }
  }

  gauge "network_in_sum" {
    source promql "network_in" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkReceiveThroughput_sum{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'}) / sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkReceiveThroughput_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "network_in_count" {
    source promql "network_in" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkReceiveThroughput_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "network_out_sum" {
    source promql "network_out" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkTransmitThroughput_sum{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }

  gauge "network_out_count" {
    source promql "network_out" {
      query = "sum by (DBInstanceIdentifier) (amazonaws_com_AWS_RDS_NetworkTransmitThroughput_count{DBInstanceIdentifier=~'${join("|", resources.all.DBInstanceIdentifier)}'})"
    }
  }
}
