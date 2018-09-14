#!/bin/bash 
# https://hub.docker.com/_/telegraf/

source docker_env_vars.sh

dk="docker run --rm ${user}"

${dk} telegraf -h

# ${dk} telegraf -sample-config -input-filter cpu:mem -output-filter influxdb > telegraf_example.conf
# ${dk} -v "${telegraf_config}":/etc/telegraf/telegraf.conf:ro telegraf -config /etc/telegraf/telegraf.conf -test
