#!/bin/bash
# https://hub.docker.com/_/influxdb/

source docker_env_vars.sh

[[ ! -d "${db_dir}" ]] && echo "'${db_dir}' does NOT exist!" && exit 255

echo 'To generate the default configuration file:
> docker run --rm influxdb influxd config > influxdb.conf
'

db_config="$PWD/influxdb.conf"

opt_graphite="-p 2003:2003 -e INFLUXDB_GRAPHITE_ENABLED=true"
opt_admin="-p 8083:8083 -e INFLUXDB_ADMIN_ENABLED=true"


## Create/remove the shared network
nid=$(docker network ls --filter "name=${network_name}" -q)
# echo $nid
if [ "${nid}" == "" ]; then
    docker network create ${network_name} --driver bridge > /dev/null
    echo "Bridge to the network, '${network_name}'."

    finish() {
        docker network rm ${network_name} > /dev/null
        echo "Remove the '${network_name}' network."
    }

    trap finish EXIT

else
    echo "The bridge network -- '${network_name}' -- has already existed."
fi


docker run --name=${i_container_name} --net=${network_name} --rm ${user}  \
    -p 8086:8086  \
    ${opt_admin}  \
    ${opt_graphite}  \
    -v "${db_dir}":/var/lib/influxdb  \
    -v "${db_config}":/etc/influxdb/influxdb.conf:ro  \
    -v "$PWD/tmp":/tmp/tmp  \
    influxdb -config /etc/influxdb/influxdb.conf
