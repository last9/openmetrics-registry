scraper prometheus_kube_cluster module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  gauge "available_nodes" {
    source prometheus "available_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='Ready', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='Ready'}), 'cluster', '$input{cluster}', '', '')"
    }
  }

  gauge "disk_pressure_nodes" {
    source prometheus "disk_pressure_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='DiskPressure', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='DiskPressure'}), 'cluster', '$input{cluster}', '', '')"
    }
  }

  gauge "pid_pressure_nodes" {
    source prometheus "pid_pressure_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='PIDPressure', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='PIDPressure'}), 'cluster', '$input{cluster}', '', '')"
    }
  }

  gauge "memory_pressure_nodes" {
    source prometheus "memory_pressure_nodes" {
      query = "label_replace(sum by (cluster)(kube_node_status_condition{condition='MemoryPressure', status='true'})/ sum by (cluster)(kube_node_status_condition{condition='MemoryPressure'}), 'cluster', '$input{cluster}', '', '')"
    }
  }

  gauge "requested_memory" {
    source prometheus "requested_memory" {
      query = "label_replace(sum(kube_pod_container_resource_requests{resource='memory', unit='byte'})/sum by (cluster)(kube_node_status_allocatable{resource='memory', unit='byte'}), 'cluster', '$input{cluster}', '', '')"
    }
  }

  gauge "requested_cpu" {
    source prometheus "requested_cpu" {
      query = "label_replace(sum(kube_pod_container_resource_requests{resource='cpu', unit='core'})/sum by (cluster)(kube_node_status_allocatable{resource='cpu', unit='core'}), 'cluster', '$input{cluster}', '', '')"
    }
  }

  gauge "saturated_nodes" {
    source prometheus "saturated_nodes" {
      query = "label_replace(sum by (cluster) (kube_node_spec_unschedulable{}), 'cluster', '$input{cluster}', '', '')"
    }
  }
}
