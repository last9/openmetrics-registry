config stackdriver "default" {
  project_id = "last9-production"
  credentials_file = env("GCP_CREDS_FILE")
}

extends gcp_cloudsql_physical "scraper_gcp_cloudsql_physical" {
  resources = <<-EOF
    [{ "id": "last9:mysql-test" }]
  EOF
  module_uri = "../gcp/cloudsql.hcl"
  using = {
    default  = "default"
  }
}

extends gcp_cloudsql_logical "scraper_gcp_cloudsql_logical" {
  resources = <<-EOF
    [{ "id": "last9:mysql-test" }]
  EOF
  module_uri = "../gcp/cloudsql.hcl"
  using = {
    default  = "default"
  }
}
