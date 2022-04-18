.ONESHELL:
SHELL = /bin/bash

BINARY_DOWNLOAD_URL=https://last9.jfrog.io/artifactory/last9-openmetrics-exporter/release-v0.2/openmetrics-exporter_release-v0.2_linux_amd64

load_last9_openmetrics_cli:
	which /tmp/last9/openmetrics-exporter || (mkdir -p /tmp/last9; cd /tmp/last9; wget $(BINARY_DOWNLOAD_URL) -O openmetrics-exporter; chmod +x openmetrics-exporter)

lint:
	find ../aws -name "*.hcl" | xargs -I {} bash -c "printf 'Linting {}\n' && diff {} <(hclfmt -check {})"

hclfmt:
	find ../aws -name "*.hcl" | xargs hclfmt -w

# TODO:
# 	* Run the ./run_test.sh script before running make plan
# 	* make sure that:
# 		[] GCP creds file path is set as the env variable GCP_CREDS_FILE
# 		[x] And the AWS_PROFILE is sourced correctly
plan: load_last9_openmetrics_cli
	/tmp/last9/openmetrics-exporter plan -d . --run-once

# Steps taken to test the modules:
#
# 	1. First it runs a HCL linter to check the general syntax and formatting of
# 	all the modules
#
# 	2. Then it run the plan command in OME to make sure that it runs
# 	successfully without any errors. Keep in mind that this test DOES NOT check
# 	the accuracy of the metrics or the queries used. This ONLY asserts that the
# 	OME specific syntax is right and performas other minor validations. Also
# 	note that extend blocks used to run the plan have dummy resources that dont
# 	yield any actual metrics.
test: lint plan
