config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var lambda {
  value = file("./my-lambdas.json")
}

var lambda_tags {
  value = <<EOF
  {
    "team": "SRE",
    "namespace": "infra",
    "service": "lambda"
  }
  EOF
}

extends aws_lambda_cloudwatch "my-lambdas" {
  resources = var.lambda
  label_set = var.lambda_tags
  module_uri = "file:///Users/urvilpatel/go/src/github.com/iox-agent-registry/aws/cloudwatch/lambda.hcl"
  using = {
    default  = "ap-south-1"
  }
}
