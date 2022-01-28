config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var nlbs {
  value = file("./my-nlbs.json")
}

var nlb_tags {
  value = <<EOF
  {
    "team": "SRE",
    "webserver": "true"
  }
  EOF
}

extends aws_nlb_cloudwatch "my-nlbs" {
  resources = var.nlbs
  label_set = var.nlb_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/nlb.hcl"
  using = {
    default  = "ap-south-1"
  }
}
