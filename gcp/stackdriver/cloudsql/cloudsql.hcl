scraper gcp_cloudsql_logical module {
  lookback   = 600
  frequency  = 60
  timeout    = 30
  resolution = 60
  lag        = 0

  gauge "connections" {
    source stackdriver "connections" {
      query {
        metric {
          type = "cloudsql.googleapis.com/database/network/connections"
        }
      }
    }
  }

  gauge "write_iops" {
    source stackdriver "write_iops" {
      query {
        metric {
          type = "cloudsql.googleapis.com/database/disk/write_ops_count"
        }
      }
    }
  }

  gauge "read_iops" {
    source stackdriver "read_iops" {
      query {
        metric {
          type = "cloudsql.googleapis.com/database/disk/read_ops_count"
        }
      }
    }
  }
}


scraper gcp_cloudsql_physical module {
  lookback   = 600
  frequency  = 60
  timeout    = 30
  resolution = 60
  lag        = 0


  gauge "cpu" {
    source stackdriver "cpu" {
      query {
        metric {
          type = "cloudsql.googleapis.com/database/cpu/utilization"
        }
      }
    }
  }

  gauge "network_in" {
    source stackdriver "network_in" {
      query {
        metric {
          type = "cloudsql.googleapis.com/database/network/received_bytes_count"
        }
      }
    }
  }

  gauge "network_out" {
    source stackdriver "network_out" {
      query {
        metric {
          type = "cloudsql.googleapis.com/database/network/sent_bytes_count"
        }
      }
    }
  }

  gauge "replica_lag" {
    source stackdriver "replica_lag" {
      query {
        metric {
          type = "cloudsql.googleapis.com/database/replication/replica_lag"
        }
      }
    }
  }
}