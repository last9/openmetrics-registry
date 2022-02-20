.ONESHELL:
SHELL = /bin/bash

load_last9_openmetrics_cli:
	which /tmp/last9/openmetrics-exporter || (mkdir -p /tmp/last9; cd /tmp/last9; wget https://last9.jfrog.io/artifactory/last9-openmetrics-exporter/release-v0.1/openmetrics-exporter_release-v0.1_linux_amd64 -O openmetrics-exporter; chmod +x openmetrics-exporter)

lint:
	find ../aws -name "*.hcl" | xargs -I {} bash -c "printf 'Linting {}\n' && diff {} <(hclfmt -check {})"

hclfmt:
	find ../aws -name "*.hcl" | xargs hclfmt -w

plan: load_last9_openmetrics_cli
	/tmp/last9/openmetrics-exporter plan -d . --run-once -o csv

test: lint plan
