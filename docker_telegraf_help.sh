#!/bin/bash 
# https://hub.docker.com/_/telegraf/

source tick_parameters.sh

dk="docker run --rm ${user}"

${dk} telegraf -h

# ${dk} telegraf -sample-config -input-filter cpu:mem -output-filter influxdb > telegraf_example.conf
# ${dk} -v "${telegraf_config}":/etc/telegraf/telegraf.conf:ro telegraf -config /etc/telegraf/telegraf.conf -test
