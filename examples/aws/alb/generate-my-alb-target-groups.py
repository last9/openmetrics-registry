#!/usr/bin/env python

import json
import sys
import boto3


def main():
    """Generate and dump LB + TargetGroup payload"""
    client = boto3.client("elbv2")
    response = client.describe_target_groups()
    output = []
    for entry in response["TargetGroups"]:
        for lb_arn in entry["LoadBalancerArns"]:
            if "loadbalancer/app" not in lb_arn:
                continue
            output.append(
                {
                    "LoadBalancer": lb_arn.split(":")[-1].split("/", 1)[-1],
                    "TargetGroup": entry["TargetGroupArn"].split(":")[-1],
                }
            )
    with open("my-alb-target-groups.json", "w") as fd:
        fd.write(json.dumps(output, indent=2, default=str))
    return 0


if __name__ == "__main__":
    sys.exit(main())
