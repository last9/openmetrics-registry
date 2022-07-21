#!/bin/bash

# This script's responsibility is to create a list of modules to be uploaded as
# release assets. To achieve that, it takes the following steps:
#
#   1. Get a list of HCL files to release
#     A. If this is a module release, then only take the list of modules that
#     have changed since he last release
#     B. If this is a major release, then take all the modules (the first
#     agruement is passed as "major")
#
#   2. Once we have that list, we need to create a mapping of those file paths
#   to the names that they will be released as
#   Format: <release asset name>:<file path>
#   Example: aws_cloudwatch_rds_v0.0.1.hcl:aws/cloudwatch/rds/rds.hcl
#
#   3. This mapping will be fed to the github action that will upload the
#   assets with the specified names

list_modules() {
  if [[ "$1" == "major" ]]; then
    find aws/ gcp/ akamai/ influxdb/ logs_to_metrics/ prometheus/ logs_to_metrics/ -name '*.hcl'
  else
    LATEST_RELEASE_TAG=$(git tag --list --sort creatordate | grep "module-\|release-" | tail -n2 | head -n1)
    git diff --name-only HEAD..$LATEST_RELEASE_TAG | grep -v "^sample\/" | find aws/ gcp/ akamai/ influxdb/ prometheus/ logs_to_metrics/ -name '*.hcl'
  fi
}

list_modules $1 | awk '{
  a=$1; b=$1; path=$1
  gsub("[[:punct:]]/", "", a);
  gsub("[[:punct:]]/", "", path);
  gsub("/", "_", a)
  n=split($1, s, "/")
  gsub(s[n], "version.txt", b)
  cmd = "cat " b
  cmd | getline c
  gsub("[[:alnum:]]+[[:punct:]]hcl", "v"c".hcl", a)
  print a":"path
}'
