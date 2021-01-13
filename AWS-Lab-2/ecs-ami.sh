#!/bin/bash
#
# Get the ID for the latest recommended ECS-optimized AMI

function usage()
{
  cat <<EOD
ecs-ami.sh [options]

Options:
  -h          Show this help and exit
  -r region   Specify AWS region
EOD
}

OPT_REGION=""

while getopts "hr:" option; do
  case "$option" in
    h) usage; exit;;
    r) OPT_REGION=$OPTARG;;
    *) usage; exit 1;;
  esac
done
shift $((OPTIND-1))

if [ ! -z "$OPT_REGION" ]; then
    OPT_REGION="--region $OPT_REGION"
fi

aws $OPT_REGION ssm get-parameters --names /aws/service/ecs/optimized-ami/amazon-linux-2/recommended \
  | jq -r ".Parameters[] | .Value" \
  | jq -r ".image_id"
