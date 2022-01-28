1. If you want to discover ELBs through some filtering criteria (e.g. having specific tags), modify and run `./generate-my-elbs.sh`

  ```
  ./generate-my-elbs.sh
  ```

  You can also have a static list of ELBs in `my-elbs.json`

2. Generate and show output metrics in debuggable format

  ```
  /tmp/iox-agent plan --dir .
  ```

3. Emit metrics on `http://localhost:9100/metrics`

  ```
  /tmp/iox-agent run openmetricsLast9 --dir .
  ```
