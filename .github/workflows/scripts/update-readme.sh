#!/bin/bash
# This script prepares the charts.yaml files for data-services and platform-services of hypertrace based on the latest version of those services.

print_header() {
    cat ".github/workflows/scripts/header.txt"
    echo
}

print_footer() {
    cat ".github/workflows/scripts/footer.txt"
    echo
}

update_readme () {
        print_header
        echo ''
        echo '| Module Name | Latest Version | Download |'
        echo '| ------- | -------- | --------- | '
        echo '| AWS Cloudwatch ALB | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_alb.hcl) | '
        echo '| AWS Cloudwatch API Gateway | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_apigateway.hcl) | '
        echo '| AWS Cloudwatch EC2 | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_ec2.hcl) | '
        echo '| AWS Cloudwatch EKS | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_eks.hcl) | '
        echo '| AWS Cloudwatch ELB | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_elb.hcl) | '
        echo '| AWS Cloudwatch Lambda | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_lambda.hcl) | '
        echo '| AWS Cloudwatch NLB | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_nlb.hcl) | '
        echo '| AWS Cloudwatch RDS | '$module_version '| [Download](https://github.com/last9/openmetrics-registy/releases/download/'$module_version'/aws_cloudwatch_rds.hcl) | '
        echo ''
        print_footer
}

if [ $1 == "update-readme" ]; then
    readme_file="README.md"
    update_readme > "${readme_file}"
fi