scraper akamai_endpoint module {
  lookback = 1500
  # Should be less than frequency
  timeout    = 30
  resolution = 60
  frequency  = 60
  lag        = 0


  gauge "status_3xx" {
    source akamai "edgeHits" {
      key    = "edgeHits"
      report = "todaytraffic-hits-by-cpcode"
      filters = {
        response_class = ["3xx"]
      }
    }
  }

  gauge "status_4xx" {
    source akamai "edgeHits" {
      key    = "edgeHits"
      report = "todaytraffic-hits-by-cpcode"
      filters = {
        response_class = ["4xx"]
      }
    }
  }

  gauge "status_5xx" {
    source akamai "edgeHits" {
      key    = "edgeHits"
      report = "todaytraffic-hits-by-cpcode"
      filters = {
        response_class = ["5xx"]
      }
    }
  }

  gauge "edgeHits" {
    source akamai "edgeHits" {
      key    = "edgeHits"
      report = "todaytraffic-hits-by-cpcode"
      filters = {
        response_class = ["2xx", "3xx", "4xx", "5xx"]
      }
    }
  }

  gauge "originHits" {
    source akamai "originHits" {
      key    = "originHits"
      report = "todaytraffic-hits-by-cpcode"
    }
  }

  gauge "hitsOffload" {
    source akamai "hitsOffload" {
      key    = "hitsOffload"
      report = "todaytraffic-hits-by-cpcode"
    }
  }
}
