config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var rds {
  value = file("./my-rds.json")
}

var rds_tags {
  value = <<EOF
  {
    "team": "SRE"
  }
  EOF
}

extends aws_rds_cloudwatch "my-rds" {
  resources = var.rds
  label_set = var.rds_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/rds.hcl"
  using = {
    default  = "ap-south-1"
  }
}
