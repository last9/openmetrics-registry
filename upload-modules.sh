#!/bin/bash

set -eou pipefail

\find aws/cloudwatch -type f | while IFS= read -r module; do
  module_name=$(basename "$module")
  aws s3 cp "$module" "s3://last9-iox-agent-modules/latest/$module_name" >/dev/null
  aws s3api put-object-acl --bucket last9-iox-agent-modules --key "latest/$module_name" --acl public-read
  echo "download_url=https://last9-iox-agent-modules.s3.ap-south-1.amazonaws.com/latest/$module_name"
done

