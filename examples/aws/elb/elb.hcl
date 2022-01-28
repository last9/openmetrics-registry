config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var elbs {
  value = file("./my-elbs.json")
}

var elb_tags {
  value = <<EOF
  {
    "team": "SRE",
    "webserver": "true"
  }
  EOF
}

extends aws_elb_cloudwatch "my-elbs" {
  resources = var.elbs
  label_set = var.elb_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/elb.hcl"
  using = {
    default  = "ap-south-1"
  }
}
