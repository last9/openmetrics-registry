scraper aws_cloudfront_cloudwatch module {
  frequency  = 60
  lookback   = 600
  timeout    = 30
  resolution = 60
  lag        = 60


  gauge "status_5xx" {
    source cloudwatch "5xx" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/CloudFront"
        metric_name = "5xxErrorRate"
        dimensions = {
          "DistributionId" = resources.each.DistributionId
          "Region"         = resources.each.Region
        }
      }
    }
  }

  gauge "status_4xx" {
    source cloudwatch "4xx" {
      query {
        aggregator  = "Maximum"
        namespace   = "AWS/CloudFront"
        metric_name = "4xxErrorRate"
        dimensions = {
          "DistributionId" = resources.each.DistributionId
          "Region"         = resources.each.Region
        }
      }
    }
  }

  gauge "bytes_out" {
    source cloudwatch "bytes_out" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/CloudFront"
        metric_name = "BytesDownloaded"
        dimensions = {
          "DistributionId" = resources.each.DistributionId
          "Region"         = resources.each.Region
        }
      }
    }
  }

  gauge "bytes_in" {
    source cloudwatch "bytes_in" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/CloudFront"
        metric_name = "BytesUploaded"
        dimensions = {
          "DistributionId" = resources.each.DistributionId
          "Region"         = resources.each.Region
        }
      }
    }
  }

  gauge "throughput" {
    source cloudwatch "throughput" {
      query {
        aggregator  = "Sum"
        namespace   = "AWS/CloudFront"
        metric_name = "Requests"
        dimensions = {
          "DistributionId" = resources.each.DistributionId
          "Region"         = resources.each.Region
        }
      }
    }
  }
}
