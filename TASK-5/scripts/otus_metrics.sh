#!/bin/bash

ACTION=$1
METRIC=$2

case "$ACTION" in
  "discovery")
    cat <<EOF
{
  "data": [
    {"{#METRIC_NAME}": "metric1"},
    {"{#METRIC_NAME}": "metric2"},
    {"{#METRIC_NAME}": "metric3"}
  ]
}
EOF
    ;;

  "value")
    echo 100
  ;;

  *)
    echo "Usage: $0 {discovery|value} [metric_name]"
    exit 1
    ;;
esac