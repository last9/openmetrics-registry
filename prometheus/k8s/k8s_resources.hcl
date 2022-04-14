scraper promql_kube_cluster module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  gauge "available_nodes" {
    source promql "available_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='Ready', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='Ready'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "disk_pressure_nodes" {
    source promql "disk_pressure_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='DiskPressure', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='DiskPressure'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "pid_pressure_nodes" {
    source promql "pid_pressure_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='PIDPressure', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='PIDPressure'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "memory_pressure_nodes" {
    source promql "memory_pressure_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='MemoryPressure', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='MemoryPressure'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "requested_memory" {
    source promql "requested_memory" {
      query = "label_replace(sum(kube_pod_container_resource_requests{resource='memory', unit='byte'})/sum by (cluster)(kube_node_status_allocatable{resource='memory', unit='byte'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "requested_cpu" {
    source promql "requested_cpu" {
      query = "label_replace(sum(kube_pod_container_resource_requests{resource='cpu', unit='core'})/sum by (cluster)(kube_node_status_allocatable{resource='cpu', unit='core'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "saturated_nodes" {
    source promql "saturated_nodes" {
      query = "label_replace(sum by (cluster) (kube_node_spec_unschedulable{}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }
}

scraper promql_kube_cluster_with_namespace module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  gauge "unscheduled_pods" {
    source promql "unscheduled_pods" {
      query = "label_replace(sum by (cluster, namespace) (increase(kube_pod_status_unschedulable{}[1m])), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "desired_pods" {
    source promql "desired_pods" {
      query = "label_replace(sum by (cluster, namespace) (increase(kube_pod_status_phase{}[1m])), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "running_pods" {
    source promql "running_pods" {
      query = "label_replace(sum by (cluster, namespace) (kube_pod_status_phase{phase=~'Running'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "pending_pods" {
    source promql "pending_pods" {
      query = "label_replace(sum by (cluster, namespace) (kube_pod_status_phase{phase=~'Pending'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "failed_and_unknown_pods" {
    source promql "failed_and_unknown_pods" {
      query = "label_replace(sum by (cluster, namespace) (kube_pod_status_phase{phase=~'Failed|Unknown'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "container_restarts" {
    source promql "container_restarts" {
      query = "label_replace(sum by (cluster, namespace) (rate(kube_pod_container_status_restarts_total{}[1m])*60), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

}

scraper promql_kube_node module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  gauge "disk_pressure" {
    source promql "disk_pressure" {
      query = "label_replace(sum by (cluster, node)(kube_node_status_condition{condition='DiskPressure', status='true'})/ sum by (cluster, node)(kube_node_status_condition{condition='DiskPressure'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "pid_pressure" {
    source promql "pid_pressure" {
      query = "label_replace(sum by (cluster, node)(kube_node_status_condition{condition='PIDPressure', status='true'})/ sum by (cluster, node)(kube_node_status_condition{condition='PIDPressure'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "memory_pressure" {
    source promql "memory_pressure" {
      query = "label_replace(sum by (cluster, node)(kube_node_status_condition{condition='MemoryPressure', status='true'})/ sum by (cluster, node)(kube_node_status_condition{condition='MemoryPressure'}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }

  gauge "saturated" {
    source promql "saturated" {
      query = "label_replace(sum by (cluster, node) (kube_node_spec_unschedulable{}), 'cluster', '${resources.each.cluster}', '', '')"
    }
  }
}
