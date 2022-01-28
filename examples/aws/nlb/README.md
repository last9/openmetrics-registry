1. If you want to discover NLBs through some filtering criteria (e.g. having specific tags), modify and run `./generate-my-nlbs.sh`

  ```
  ./generate-my-nlbs.sh
  ```

  You can also have a static list of NLBs in `my-nlbs.json`

2. Generate and show output metrics in debuggable format

  ```
  /tmp/iox-agent plan --dir .
  ```

3. Emit metrics on `http://localhost:9100/metrics`

  ```
  /tmp/iox-agent run openmetrics --dir .
  ```
