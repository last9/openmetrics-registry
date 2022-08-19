scraper prometheus_kube_cluster module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  gauge "available_nodes" {

    source promql "available_nodes" {
      query = "sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='Ready', status='true'}) *100 / sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='Ready'})"

    }
  }

  gauge "disk_pressure_nodes" {
    source promql "disk_pressure_nodes" {
      query = "sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='DiskPressure', status='true'}) *100 / sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='DiskPressure', })"

    }
  }

  gauge "pid_pressure_nodes" {
    source promql "pid_pressure_nodes" {
      query = "sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='PIDPressure', status='true'}) *100/ sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='PIDPressure'})"
    }
  }

  gauge "memory_pressure_nodes" {


    source promql "memory_pressure_nodes" {
      query = "sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='MemoryPressure', status='true'}) *100 / sum by (cluster)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='MemoryPressure'})"

    }
  }

  gauge "requested_memory" {


    source promql "requested_memory" {
      query = "sum(kube_pod_container_resource_requests{cluster=~'${join("|", resources.all.cluster)}',resource='memory', unit='byte'})/sum by (cluster)(kube_node_status_allocatable{cluster=~'${join("|", resources.all.cluster)}',resource='memory', unit='byte'})"
    }
  }

  gauge "requested_cpu" {

    source promql "requested_cpu" {
      query = "sum(kube_pod_container_resource_requests{cluster=~'${join("|", resources.all.cluster)}',resource='cpu', unit='core'})/sum by (cluster)(kube_node_status_allocatable{cluster=~'${join("|", resources.all.cluster)}',resource='cpu', unit='core'})"
    }
  }

  gauge "saturated_nodes" {

    source promql "saturated_nodes" {
      query = "sum by (cluster) (kube_node_spec_unschedulable{cluster=~'${join("|", resources.all.cluster)}'})"
    }
  }
}

scraper prometheus_kube_cluster_with_namespace module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60


  gauge "unscheduled_pods" {

    source promql "unscheduled_pods" {
      query = "sum by (cluster, namespace) (increase(kube_pod_status_unschedulable{cluster=~'${join("|", resources.all.cluster)}'}[1m]))"

    }
  }

  gauge "desired_pods" {

    source promql "desired_pods" {
      query = "sum by (cluster, namespace) (increase(kube_pod_status_phase{cluster=~'${join("|", resources.all.cluster)}'}[1m]))"
    }
  }

  gauge "running_pods" {

    source promql "running_pods" {
      query = "sum by (cluster, namespace) (kube_pod_status_phase{cluster=~'${join("|", resources.all.cluster)}',phase=~'Running'})"
    }
  }

  gauge "pending_pods" {


    source promql "pending_pods" {
      query = "sum by (cluster, namespace) (kube_pod_status_phase{cluster=~'${join("|", resources.all.cluster)}',phase=~'Pending'})"
    }
  }

  gauge "failed_and_unknown_pods" {

    source promql "failed_and_unknown_pods" {
      query = "sum by (cluster, namespace) (kube_pod_status_phase{cluster=~'${join("|", resources.all.cluster)}',phase=~'Failed|Unknown'})"
    }
  }

  gauge "container_restarts" {


    source promql "container_restarts" {
      query = "sum by (cluster, namespace) (rate(kube_pod_container_status_restarts_total{cluster=~'${join("|", resources.all.cluster)}'}[1m])*60)"

    }
  }
}

scraper prometheus_kube_node module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60


  gauge "disk_pressure" {


    source promql "disk_pressure" {
      query = "sum by (cluster, node)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}',condition='DiskPressure', status='true'})"

    }
  }

  gauge "pid_pressure" {


    source promql "pid_pressure" {
      query = "sum by (cluster, node)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}', condition='PIDPressure', status='true'})"

    }
  }

  gauge "memory_pressure" {


    source promql "memory_pressure" {
      query = "sum by (cluster, node)(kube_node_status_condition{cluster=~'${join("|", resources.all.cluster)}', condition='MemoryPressure', status='true'})"
    }
  }

  gauge "saturated" {


    source promql "saturated" {
      query = "sum by (cluster, node) (kube_node_spec_unschedulable{cluster=~'${join("|", resources.all.cluster)}'})"
    }
  }
}

scraper prometheus_kube_pod_grp module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  gauge "container_restarted" {


    source promql "container_restarted" {
      query = <<EOT
      sum without (pod) (label_replace(sum by (cluster, namespace, pod_group, pod) (rate(kube_pod_container_status_restarts_total{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}[1m])*60), 'pod_group', '$1', 'pod', '(\\D+)-(.*)'))
      EOT

    }
  }

  gauge "containers_failed" {


    source promql "containers_failed" {
      query = <<EOT
      sum without (pod) (label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_terminated_reason{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*',reason!='Completed'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)'))
      EOT

    }
  }

  gauge "containers_running" {


    source promql "containers_running" {
      query = <<EOT
      sum without (pod) (label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_running{cluster=~'${join("|", resources.all.cluster)}',pod=~'.*-.*'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)'))
      EOT

    }
  }

  gauge "containers_desired" {


    source promql "containers_desired" {
      query = <<EOT
      sum without (pod) (label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_terminated{cluster=~'${join("|", resources.all.cluster)}',pod=~'.*-.*'}) + sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_running{cluster=~'${join("|", resources.all.cluster)}',pod=~'.*-.*'}) + sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_waiting{cluster=~'${join("|", resources.all.cluster)}',pod=~'.*-.*'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)'))
      EOT

    }
  }

  gauge "containers_cold" {


    source promql "containers_cold" {
      query = <<EOT
      sum without (pod) (label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_running{cluster=~'${join("|", resources.all.cluster)}'}) - sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_ready{cluster=~'${join("|", resources.all.cluster)}',pod=~'.*-.*'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)'))
      EOT

    }
  }
}

scraper prometheus_kube_pod module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60


  gauge "container_restarted" {

    source promql "container_restarted" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod) (rate(kube_pod_container_status_restarts_total{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}[1m])*60), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "containers_failed" {

    source promql "containers_failed" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_terminated_reason{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*',reason!='Completed'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "containers_running" {


    source promql "containers_running" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_running{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "containers_desired" {


    source promql "containers_desired" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_terminated{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}) +  sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_running{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}) +  sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_waiting{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "containers_cold" {

    source promql "containers_cold" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_running{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}) - sum by (cluster, namespace, pod_group, pod) (kube_pod_container_status_ready{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }
}

scraper prometheus_kube_container module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60

  gauge "total_container_restarts" {


    source promql "total_container_restarts" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod, container) (rate(kube_pod_container_status_restarts_total{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*'}[1m])*60), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "container_in_terminated" {

    source promql "container_in_terminated" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod, container) (kube_pod_container_status_terminated_reason{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*',reason!='Completed'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "container_in_waiting" {

    source promql "container_in_waiting" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod, container) (kube_pod_container_status_waiting_reason{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*', reason!='ContainerCreating', reason!='PodInitializing'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "container_cpu_limit" {


    source promql "container_cpu_limit" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod, container) (kube_pod_container_resource_limits{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*', resource='cpu', unit='core'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }

  gauge "container_memory_limit" {


    source promql "container_memory_limit" {
      query = <<EOT
      label_replace(sum by (cluster, namespace, pod_group, pod, container) (kube_pod_container_resource_limits{cluster=~'${join("|", resources.all.cluster)}', pod=~'.*-.*', resource='memory', unit='byte'}), 'pod_group', '$1', 'pod', '(\\D+)-(.*)')
      EOT

    }
  }
}

scraper prometheus_kube_deployment module {
  frequency  = 120
  lookback   = 600
  timeout    = 90
  resolution = 60
  lag        = 60


  gauge "unavailable_replicas" {

    source promql "unavailable_replicas" {
      query = "sum by (cluster, namespace, deployment) (kube_deployment_status_replicas_unavailable{cluster=~'${join("|", resources.all.cluster)}'})"

    }
  }

  gauge "desired_replicas" {
    source promql "desired_replicas" {
      query = "sum by (cluster, namespace, deployment) (kube_deployment_spec_replicas{cluster=~'${join("|", resources.all.cluster)}'})"
    }
  }


  gauge "cold_replicas" {

    source promql "cold_replicas" {
      query = "sum by (cluster, namespace, deployment) (kube_deployment_status_replicas{cluster=~'${join("|", resources.all.cluster)}'}) - sum by (cluster, namespace, deployment)(kube_deployment_status_replicas_available{cluster=~'${join("|", resources.all.cluster)}'})"

    }
  }
}


