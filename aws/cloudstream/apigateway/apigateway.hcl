scraper aws_apigateway_cloudstream module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60

  gauge "throughput" {
    source promql "throughput" {
      query = "sum by (ApiName) (amazonaws_com_AWS_ApiGateway_Count_count{ApiName=~'${join("|", resources.all.ApiName)}', Namespace!=''})"
    }
  }

  gauge "4XX" {
    source promql "4XX" {
      query = "sum by (ApiName) (amazonaws_com_AWS_ApiGateway_4XXError_count{ApiName=~'${join("|", resources.all.ApiName)}', Namespace!=''})"
    }
  }

  gauge "5XX" {
    source promql "5XX" {
      query = "sum by (ApiName) (amazonaws_com_AWS_ApiGateway_5XXError_count{ApiName=~'${join("|", resources.all.ApiName)}', Namespace!=''})"
    }
  }

  gauge "latency" {
    source promql "latency" {
      query = "sum by (ApiName) (amazonaws_com_AWS_ApiGateway_Latency_count{ApiName=~'${join("|", resources.all.ApiName)}', Namespace!=''})"
    }
  }

  gauge "integration_latency" {
    source promql "integration_latency" {
      query = "sum by (ApiName) (amazonaws_com_AWS_ApiGateway_IntegrationLatency_count{ApiName=~'${join("|", resources.all.ApiName)}', Namespace!=''})"
    }
  }
}

