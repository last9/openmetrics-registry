scraper aws_eks_cluster_cloudwatch module {
  frequency  = 10
  lookback   = 600
  timeout    = 5
  resolution = 60
  lag        = 120

  gauge "cluster_node_count" {
    source cloudwatch "cluster_node_count" {
      query {
        aggregator  = "Maximum"
        namespace   = "ContainerInsights"
        metric_name = "cluster_node_count"
        dimensions = {
          ClusterName = resources.each.ClusterName
        }
      }
    }
  }

  gauge "cluster_failed_node_count" {
    source cloudwatch "cluster_failed_node_count" {
      query {
        aggregator  = "Maximum"
        namespace   = "ContainerInsights"
        metric_name = "cluster_failed_node_count"
        dimensions = {
          ClusterName = resources.each.ClusterName
        }
      }
    }
  }

  gauge "node_cpu_utilization" {
    source cloudwatch "node_cpu_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "node_cpu_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
        }
      }
    }
  }

  gauge "node_memory_utilization" {
    source cloudwatch "node_memory_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "node_memory_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
        }
      }
    }
  }

  gauge "node_filesystem_utilization" {
    source cloudwatch "node_filesystem_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "node_filesystem_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
        }
      }
    }
  }
}

scraper aws_eks_service_cloudwatch module {
  frequency  = 10
  lookback   = 600
  timeout    = 5
  resolution = 60
  lag        = 120

  gauge "pod_cpu_utilization" {
    source cloudwatch "pod_cpu_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_cpu_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          Service     = resources.each.Service
        }
      }
    }
  }

  gauge "pod_memory_utilization" {
    source cloudwatch "pod_memory_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_memory_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          Service     = resources.each.Service
        }
      }
    }
  }

  gauge "pod_cpu_utilization_over_pod_limit" {
    source cloudwatch "pod_cpu_utilization_over_pod_limit" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_cpu_utilization_over_pod_limit"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          Service     = resources.each.Service
        }
      }
    }
  }

  gauge "pod_memory_utilization_over_pod_limit" {
    source cloudwatch "pod_memory_utilization_over_pod_limit" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_memory_utilization_over_pod_limit"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          Service     = resources.each.Service
        }
      }
    }
  }

  gauge "pod_network_rx_bytes" {
    source cloudwatch "pod_network_rx_bytes" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_network_rx_bytes"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          Service     = resources.each.Service
        }
      }
    }
  }

  gauge "pod_network_tx_bytes" {
    source cloudwatch "pod_network_tx_bytes" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_network_tx_bytes"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          Service     = resources.each.Service
        }
      }
    }
  }

  gauge "service_number_of_running_pods" {
    source cloudwatch "service_number_of_running_pods" {
      query {
        aggregator  = "Maximum"
        namespace   = "ContainerInsights"
        metric_name = "service_number_of_running_pods"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          Service     = resources.each.Service
        }
      }
    }
  }
}

scraper aws_eks_pod_cloudwatch module {
  frequency  = 10
  lookback   = 600
  timeout    = 5
  resolution = 60
  lag        = 120

  gauge "pod_cpu_utilization" {
    source cloudwatch "pod_cpu_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_cpu_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          PodName     = resources.each.PodName
        }
      }
    }
  }

  gauge "pod_memory_utilization" {
    source cloudwatch "pod_memory_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_memory_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          PodName     = resources.each.PodName
        }
      }
    }
  }

  gauge "pod_cpu_utilization_over_pod_limit" {
    source cloudwatch "pod_cpu_utilization_over_pod_limit" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_cpu_utilization_over_pod_limit"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          PodName     = resources.each.PodName
        }
      }
    }
  }

  gauge "pod_memory_utilization_over_pod_limit" {
    source cloudwatch "pod_memory_utilization_over_pod_limit" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_memory_utilization_over_pod_limit"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          PodName     = resources.each.PodName
        }
      }
    }
  }

  gauge "pod_network_rx_bytes" {
    source cloudwatch "pod_network_rx_bytes" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_network_rx_bytes"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          PodName     = resources.each.PodName
        }
      }
    }
  }

  gauge "pod_network_tx_bytes" {
    source cloudwatch "pod_network_rx_bytes" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "pod_network_tx_bytes"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          PodName     = resources.each.PodName
        }
      }
    }
  }

  gauge "pod_number_of_container_restarts" {
    source cloudwatch "pod_number_of_container_restarts" {
      query {
        aggregator  = "Sum"
        namespace   = "ContainerInsights"
        metric_name = "pod_number_of_container_restarts"
        dimensions = {
          ClusterName = resources.each.ClusterName
          Namespace   = resources.each.Namespace
          PodName     = resources.each.PodName
        }
      }
    }
  }
}

scraper aws_eks_node_cloudwatch module {
  frequency  = 10
  lookback   = 600
  timeout    = 5
  resolution = 60
  lag        = 120

  gauge "node_cpu_utilization" {
    source cloudwatch "node_cpu_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "node_cpu_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
          NodeName    = resources.each.NodeName
          InstanceId  = resources.each.InstanceId
        }
      }
    }
  }

  gauge "node_filesystem_utilization" {
    source cloudwatch "node_filesystem_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "node_filesystem_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
          NodeName    = resources.each.NodeName
          InstanceId  = resources.each.InstanceId
        }
      }
    }
  }

  gauge "node_memory_utilization" {
    source cloudwatch "node_memory_utilization" {
      query {
        aggregator  = "Average"
        namespace   = "ContainerInsights"
        metric_name = "node_memory_utilization"
        dimensions = {
          ClusterName = resources.each.ClusterName
          NodeName    = resources.each.NodeName
          InstanceId  = resources.each.InstanceId
        }
      }
    }
  }

  gauge "node_number_of_running_pods" {
    source cloudwatch "node_number_of_running_pods" {
      query {
        aggregator  = "Maximum"
        namespace   = "ContainerInsights"
        metric_name = "node_number_of_running_pods"
        dimensions = {
          ClusterName = resources.each.ClusterName
          NodeName    = resources.each.NodeName
          InstanceId  = resources.each.InstanceId
        }
      }
    }
  }

  gauge "node_number_of_running_containers" {
    source cloudwatch "node_number_of_running_containers" {
      query {
        aggregator  = "Maximum"
        namespace   = "ContainerInsights"
        metric_name = "node_number_of_running_containers"
        dimensions = {
          ClusterName = resources.each.ClusterName
          NodeName    = resources.each.NodeName
          InstanceId  = resources.each.InstanceId
        }
      }
    }
  }
}
