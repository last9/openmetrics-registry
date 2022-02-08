config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var gws {
  value = file("./my-gw.json")
}

var gw_tags {
  value = <<EOF
  {
    "team": "SRE"
  }
  EOF
}

extends aws_apigateway_cloudwatch "my-gws" {
  resources = var.gws
  label_set = var.gw_tags
  module_uri = "file:///Users/urvilpatel/go/src/github.com/iox-agent-registry/aws/cloudwatch/apigateway.hcl"
  using = {
    default  = "ap-south-1"
  }
}
