config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

// EKS Cluster metrics

var eks_clusters {
  value = file("./my-eks-clusters.json")
}

var eks_cluster_tags {
  value = <<EOF
  {
    "team": "SRE",
  }
  EOF
}

extends aws_eks_cluster_cloudwatch "my-eks_clusters" {
  resources = var.eks_clusters
  label_set = var.eks_cluster_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/eks.hcl"
  using = {
    default  = "ap-south-1"
  }
}

// EKS Cluster services metrics

var eks_clusters_services {
  value = file("./my-eks-clusters-services.json")
}

var eks_clusters_services_tags {
  value = <<EOF
  {
    "team": "SRE",
  }
  EOF
}

extends aws_eks_service_cloudwatch "my-eks_clusters_services" {
  resources = var.eks_clusters_services
  label_set = var.eks_clusters_services_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/eks.hcl"
  using = {
    default  = "ap-south-1"
  }
}

// EKS Cluster pod metrics
var eks_clusters_pods {
  value = file("./my-eks-clusters-pods.json")
}

var eks_clusters_pods_tags {
  value = <<EOF
  {
    "team": "SRE",
  }
  EOF
}

extends aws_eks_pod_cloudwatch "my-eks_clusters_pods" {
  resources = var.eks_clusters_pods
  label_set = var.eks_clusters_pods_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/eks.hcl"
  using = {
    default  = "ap-south-1"
  }
}

// EKS Cluster node metrics
var eks_clusters_nodes {
  value = file("./my-eks-clusters-nodes.json")
}

var eks_clusters_nodes_tags {
  value = <<EOF
  {
    "team": "SRE",
  }
  EOF
}

extends aws_eks_node_cloudwatch "my-eks_clusters_nodes" {
  resources = var.eks_clusters_nodes
  label_set = var.eks_clusters_nodes_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/eks.hcl"
  using = {
    default  = "ap-south-1"
  }
}
