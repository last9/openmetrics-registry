#!/usr/bin/env python

import json
import sys
import boto3


def main():

    client = boto3.client("apigateway")
    response = client.get_rest_apis()
    output = []

    for entry in response["items"]:
        id = entry["id"]
        name = entry["name"]

        stagesRes = client.get_stages(restApiId=id)
        for entry in stagesRes["item"]:
            stage = entry["stageName"]
            output.append(
                {
                    "ApiName": name,
                    "Stage": stage,
                }
            )

    with open("my-gw.json", "w") as fd:
        # Ensure that json dumps have sort_keys true to generate same json if there
        # are no infra changes
        fd.write(json.dumps(output, indent=2, sort_keys=True, default=str))
    return 0


if __name__ == "__main__":
    sys.exit(main())
