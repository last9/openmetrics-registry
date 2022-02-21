aws rds describe-db-instances | \
  jq '.DBInstances[] | .DBInstanceIdentifier | {DBInstanceIdentifier: .}' | \
  jq '. + {account: "production"}' | \
  jq -s > "my-rds.json"
