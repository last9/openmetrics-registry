config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var eks_clusters {
  value = file("./my-eks-clusters.json")
}

var eks_cluster_tags {
  value = <<EOF
  {
    "team": "SRE",
    "webserver": "true"
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
