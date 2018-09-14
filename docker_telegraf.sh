#!/bin/bash 
# https://hub.docker.com/_/telegraf/

source docker_env_vars.sh

echo 'To generate the configuration file:
> docker run --rm telegraf telegraf config > telegraf.conf
'

telegraf_config="$PWD/telegraf.conf"
telegraf_outputs="/tmp/metrics.out"
touch "${telegraf_outputs}"

docker run --name=${t_container_name} --net=${network_name} --rm ${user}  \
    -v "${telegraf_config}":/etc/telegraf/telegraf.conf:ro  \
    telegraf -test
echo "Test return: $?"
echo

echo '---------------------------------------------------------------'
docker run --name=${t_container_name} --net=${network_name} --rm ${user}  \
    -v "${telegraf_config}":/etc/telegraf/telegraf.conf:ro  \
    -v "${telegraf_outputs}":/tmp/metrics.out  \
    telegraf
