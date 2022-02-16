config stackdriver "default" {
  project_id = "last9"
  credentials_file = env("GCP_CREDS_FILE")
}

var cloudsql_inputs {
  value = <<-EOF
    [{ "id": "last9:mysql-test" }]
  EOF
}

extends gcp_cloudsql_physical "scraper_gcp_cloudsql_physical" {
  resources = var.cloudsql_inputs
  module_uri = "../gcp/cloudsql.hcl"
  using = {
    default  = "default"
  }

  label_set = <<-EOF
    { "team" : "platform" }
  EOF
}

extends gcp_cloudsql_logical "scraper_gcp_cloudsql_logical" {
  resources = var.cloudsql_inputs
  module_uri = "../gcp/cloudsql.hcl"
  using = {
    default  = "default"
  }

  label_set = <<-EOF
    { "team" : "platform" }
  EOF
}