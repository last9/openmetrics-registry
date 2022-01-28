config cloudwatch "ap-south-1" {
  region     = "ap-south-1"
}

var ec2 {
  value = file("./my-ec2.json")
}

var ec2_tags {
  value = <<EOF
  {
    "team": "SRE"
  }
  EOF
}

extends aws_ec2_cloudwatch "my-ec2" {
  resources = var.ec2
  label_set = var.ec2_tags
  module_uri = "file:///home/saurabh/github/last9/iox-agent-registry/aws/cloudwatch/ec2.hcl"
  using = {
    default  = "ap-south-1"
  }
}
