1. If you want to discover EC2 through some filtering criteria (e.g. having specific tags), modify and run `./generate-my-ec2.sh`

  ```
  ./generate-my-ec2.sh
  ```

  You can also have a static list of EC2 in `my-ec2.json`

2. Generate and show output metrics in debuggable format

  ```
  /tmp/iox-agent plan --dir .
  ```

3. Emit metrics on `http://localhost:9100/metrics`

  ```
  /tmp/iox-agent run openmetricsLast9 --dir .
  ```
