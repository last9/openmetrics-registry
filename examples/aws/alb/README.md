1.  If you want to discover ALBs through some filtering criteria  (e.g. specific tags), modify and run `./generate-input-resources.sh` to generate `my-albs.json`

    ```
    ./generate-input-resources.sh
    ```

    You can also have a static list of ALBs in `my-albs.json`

2. If you want to discover target groups through some filtering criteria (e.g. dump target groups only for ALBs and not for NLBs), modify and run `generate-my-alb-target-groups.py` to generate `my-alb-target-groups.json`

    ```
    ./generate-my-alb-target-groups.py
    ```

    You can also have a static list of ALBs in `my-alb-target-groups.json`

3. Generate and show output metrics in debuggable format

  ```
  /tmp/iox-agent plan --dir .
  ```

4. Emit metrics on `http://localhost:9100/metrics`

  ```
  /tmp/iox-agent run openmetrics --dir .
  ```
