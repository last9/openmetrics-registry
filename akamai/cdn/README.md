# Akamai CDN

| **Component**    | **Modules**           | **Expected Variables** | **Binary version** |  **Module Version**                                                                            | **Changelog**                                                              |
|------------------|-----------------------|--------------------------|--------------------|------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| **Akamai CDN**  | `akamai_endpoint`                 | `cpcode`                                       | [v0.6](https://last9.jfrog.io/ui/native/last9-openmetrics-exporter/release-v0.6/)             |  [v0.0.1](https://github.com/last9/openmetrics-registry/releases/download/v0.0.3/akamai_cdn_v0.0.1.hcl)             | [Changelog](https://github.com/last9/openmetrics-registry/blob/master/akamai/cdn/CHANGELOG.md)    |


## Sample extend block

```
extends akamai_endpoint "customer_akamai" {
  resources = <<-EOF
    [{"cpcode": "10XXXXX"}, {"cpcode": "XXXXX68"}]
  EOF
  module_uri = "https://github.com/last9/openmetrics-registry/releases/download/v0.0.3/akamai_cdn_v0.0.1.hcl"
  using = {
    default = "config_xyz"
  }
  label_set = <<-EOH
    { "tag_namespace": "customer-akamai", "tag_service": "customer-akamai" }
  EOH
}
```

## Sample JSON input file

```

[
  {
    "cpcode": "97XXXXX",
    "domain": "api.xyz.com",
    "service": "test-um",
    "endpoint": "/"
  }
]

```