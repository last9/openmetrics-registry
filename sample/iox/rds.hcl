config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var rds {
  value = file("./my-rds.json")
}

var rds_tags {
  value = <<EOF
  {
    "team": "My-RDS"
  }
  EOF
}

extends aws_rds_cloudwatch "my-rds" {
  resources = var.rds
  label_set = var.rds_tags
  module_uri = "https://github.com/last9/openmetrics-registry/releases/download/v0.0.1/aws_cloudwatch_rds_v0.0.1.hcl"
  using = {
    default  = "ap-south-1"
  }
}
