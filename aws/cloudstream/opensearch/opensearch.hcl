scraper aws_opensearch_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "nodes" {
    source promql "nodes" {
      query = <<-EOF
        min by(ClientId, DomainName) (amazonaws_com_AWS_ES_Nodes{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "cluster_yellow" {
    source promql "cluster_yellow" {
      query = <<-EOF
        max by(ClientId, DomainName) (amazonaws_com_AWS_ES_ClusterStatus_yellow{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "kibana_healthy_nodes" {
    source promql "kibana_healthy_nodes" {
      query = <<-EOF
        min by(ClientId, DomainName) (amazonaws_com_AWS_ES_OpenSearchDashboardsHealthyNodes{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "cluster_red" {
    source promql "cluster_red" {
      query = <<-EOF
        max by(ClientId, DomainName) (amazonaws_com_AWS_ES_ClusterStatus_red{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "cpu" {
    source promql "cpu" {
      query = <<-EOF
        avg by(ClientId, DomainName) (amazonaws_com_AWS_ES_CPUUtilization{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "throughput" {
    source promql "throughput" {
      query = <<-EOF
        sum by(ClientId, DomainName) (amazonaws_com_AWS_ES_ElasticsearchRequests_sum{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "status_4xx" {
    source promql "status_4xx" {
      query = <<-EOF
        sum by(ClientId, DomainName) (amazonaws_com_AWS_ES_4xx_sum{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "status_5xx" {
    source promql "status_5xx" {
      query = <<-EOF
        sum by(ClientId, DomainName) (amazonaws_com_AWS_ES_5xx_sum{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "free_space" {
    source promql "free_space" {
      query = <<-EOF
        sum by(ClientId, DomainName) (amazonaws_com_AWS_ES_FreeStorageSpace_sum{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "jvm_memory_pressure" {
    source promql "jvm_memory_pressure" {
      query = <<-EOF
        max by(ClientId, DomainName) (amazonaws_com_AWS_ES_JVMMemoryPressure{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "writes_blocked" {
    source promql "writes_blocked" {
      query = <<-EOF
        max by(ClientId, DomainName) (amazonaws_com_AWS_ES_ClusterIndexWritesBlocked{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "snapshot_failure" {
    source promql "snapshot_failure" {
      query = <<-EOF
        max by(ClientId, DomainName) (amazonaws_com_AWS_ES_AutomatedSnapshotFailure{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }

  gauge "master_reachable" {
    source promql "master_reachable" {
      query = <<-EOF
        min by(ClientId, DomainName) (amazonaws_com_AWS_ES_MasterReachableFromNode{ClientId=~'${join("|", resources.all.ClientId)}', DomainName=~'${join("|", resources.all.DomainName)}'})
      EOF
    }
  }
}
