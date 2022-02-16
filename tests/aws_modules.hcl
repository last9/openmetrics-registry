config cloudwatch "default" {
  region = "ap-south-1"
}

var sample_inputs {
  //value = file("${pwd}/inp.json")
  value = <<-EOF
    [{"LoadBalancer": "blah_1"}]
  EOF
}

extends aws_alb_cloudwatch "alb_ap-south-1" {
  module_uri = "../aws/cloudwatch/alb.hcl"
  resources = var.sample_inputs
  using = {
    default  = "default"
  }

  label_set = <<-EOF
    { "team" : "platform" }
  EOF
}
