#!/bin/bash


source docker_env_vars.sh

[[ -d "${db_dir}" ]] && echo "'${db_dir}' has already existed!" && exit 255
mkdir -p "${db_dir}"

influxdb_admin="-e INFLUXDB_HTTP_AUTH_ENABLED=true -e INFLUXDB_ADMIN_ENABLED=true -e INFLUXDB_ADMIN_USER=${admin_user} -e INFLUXDB_ADMIN_PASSWORD=${admin_pass}"
influxdb_user="-e INFLUXDB_DB=${db_name} -e INFLUXDB_USER=${db_user} -e INFLUXDB_USER_PASSWORD=${db_pass}"

docker run --rm ${user}  \
    ${influxdb_admin} ${influxdb_user}  \
    -v "${db_dir}":/var/lib/influxdb  \
    influxdb /init-influxdb.sh
