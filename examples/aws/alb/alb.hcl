config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var albs {
  value = file("./my-albs.json")
}

var alb_tags {
  value = <<EOF
  {
    "team": "SRE",
    "webserver": "true"
  }
  EOF
}

extends aws_alb_cloudwatch "my-albs" {
  resources = var.albs
  label_set = var.alb_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/alb.hcl"
  using = {
    default  = "ap-south-1"
  }
}
