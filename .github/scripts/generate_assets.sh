# This script's responsibility is to create a list of modules to be uploaded as
# release assets. To achieve that, it takes the following steps:
#
#   1. Get a list of HCL files that have changed from the last release -- by
#   taking a diff from the HEAD commit to the last created release tag
#
#   2. Once we have that list, we need to create a mapping of those file paths
#   to the names that they will be released as
#   Format: <release asset name>:<file path>
#   Example: aws_cloudwatch_rds_v0.0.1.hcl:aws/cloudwatch/rds/rds.hcl
#
#   3. This mapping will be fed to the github action that will upload the
#   assets with the specified names

LATEST_RELEASE_TAG=$(git tag --list --sort creatordate | grep "module-\|release-" | tail -n1)
git diff --name-only HEAD..$LATEST_RELEASE_TAG |\
  grep -v "^sample\/" | grep "\.hcl" |\
  awk '{
    a=$1; b=$1; path=$1
    gsub("/", "_", a)
    n=split($1, s, "/")
    gsub(s[n], "version.txt", b)
    cmd = "cat " b
    cmd | getline c
    gsub("[[:alnum:]]+[[:punct:]]hcl", "v"c".hcl", a)
    print a":"path
  }'
