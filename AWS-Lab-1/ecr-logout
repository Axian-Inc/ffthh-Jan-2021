#!/bin/bash

if [ -z "$AWS_DEFAULT_REGION" ]; then
    echo "AWS_DEFAULT_REGION is not set"
    exit 1
fi

account_id="$(aws sts get-caller-identity | jq -r .Account)"
endpoint="${account_id}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"

docker logout "$endpoint"

