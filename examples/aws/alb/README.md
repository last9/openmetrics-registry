- Modify and run `./generate-input-resources.sh` to generate `my-albs.json`

  ```
  ./generate-input-resources.sh
  ```

- Generate and show output metrics in debuggable format

  ```
  /tmp/iox-agent plan --dir .
  ```

- Emit metrics on `http://localhost:9100/metrics`

  ```
  /tmp/iox-agent run openmetricsLast9 --dir .
  ```
