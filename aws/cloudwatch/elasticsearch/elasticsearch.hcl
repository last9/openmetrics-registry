scraper aws_elasticsearch_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "nodes" {
    source cloudwatch "nodes" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ES"
        metric_name = "Nodes"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "kibana_healthy_nodes" {
    source cloudwatch "kibana_healthy_nodes" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ES"
        metric_name = "KibanaHealthyNodes"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "cluster_yellow" {
    source cloudwatch "cluster_yellow" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "ClusterStatus.yellow"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "cluster_red" {
    source cloudwatch "cluster_red" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "ClusterStatus.red"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "throughput" {
    source cloudwatch "throughput" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ES"
        metric_name = "ElasticsearchRequests"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "status_4xx" {
    source cloudwatch "status_4xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ES"
        metric_name = "4xx"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }


  gauge "status_5xx" {
    source cloudwatch "5xx" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ES"
        metric_name = "5xx"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "cpu" {
    source cloudwatch "cpu" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "CPUUtilization"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }


  gauge "free_space" {
    source cloudwatch "free_space" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/ES"
        metric_name = "FreeStorageSpace"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "jvm_memory_pressure" {
    source cloudwatch "jvm_memory_pressure" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "JVMMemoryPressure"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "writes_blocked" {
    source cloudwatch "writes_blocked" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "ClusterIndexWritesBlocked"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "snapshot_failure" {
    source cloudwatch "snapshot_failure" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "AutomatedSnapshotFailure"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "master_reachable" {
    source cloudwatch "master_reachable" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ES"
        metric_name = "MasterReachableFromNode"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

}

scraper aws_elasticsearch_master_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "master_reachable" {
    source cloudwatch "master_reachable" {
      query {
        aggregator  = "Minimum"
        namespace   = "AWS/ES"
        metric_name = "MasterReachableFromNode"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "cpu" {
    source cloudwatch "cpu" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "MasterCPUUtilization"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }

  gauge "jvm_memory_pressure" {
    source cloudwatch "jvm_memory_pressure" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/ES"
        metric_name = "MasterJVMMemoryPressure"

        dimensions = {
          "DomainName" = resources.each.DomainName
          "ClientId"   = resources.each.ClientId
        }
      }
    }
  }
}
