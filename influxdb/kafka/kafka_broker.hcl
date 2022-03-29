scraper kafka_cluster module {
  lookback   = 600
  frequency  = 60
  timeout    = 30
  resolution = 60
  lag        = 0

  gauge "messagesIn" {
    source influxdb "MessagesIn" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'MessagesInPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m) fill(0)"
      value = "value"
    }
  }

  gauge "produceRequests" {
    source influxdb "TotalProduceRequestsPerSec" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'TotalProduceRequestsPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m) fill(0)"
      value = "value"
    }
  }

  gauge "failedProduce" {
    source influxdb "FailedProduceRequestsPerSec" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'FailedProduceRequestsPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m) fill(0)"
      value = "value"
    }
  }

  gauge "failedFetch" {
    source influxdb "FailedFetchRequestsPerSec" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'FailedFetchRequestsPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m) fill(0)"
      value = "value"
    }
  }
}

scraper kafka_broker module {
  lookback   = 600
  frequency  = 60
  timeout    = 30
  resolution = 60
  lag        = 0


  gauge "messagesIn" {
    source influxdb "MessagesIn" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'MessagesInPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m), \"hostname\" fill(0)"
      value = "value"
    }
  }

  gauge "produceRequests" {
    source influxdb "TotalProduceRequestsPerSec" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'TotalProduceRequestsPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m), \"hostname\" fill(0)"
      value = "value"
    }
  }

  gauge "failedProduce" {
    source influxdb "FailedProduceRequestsPerSec" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'FailedProduceRequestsPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m), \"hostname\" fill(0)"
      value = "value"
    }
  }

  gauge "failedFetch" {
    source influxdb "FailedFetchRequestsPerSec" {
      db    = "kafka"
      query = "SELECT mean(OneMinuteRate) as value FROM GlobalBrokerTopicMetrics WHERE \"name\" = 'FailedFetchRequestsPerSec' AND time >= ${time.floor} AND time < ${time.ceil} group by time(1m), \"hostname\" fill(0)"
      value = "value"
    }
  }
}
