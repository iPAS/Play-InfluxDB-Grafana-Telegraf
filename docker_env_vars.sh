#!/bin/bash

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && echo "Please 'source' me!!" && exit 255


uid=$(id -u)  # saves your user id in the ID variable
gid=$(id -g)
user="--user $uid:$gid"

db_name=tick_experiment
db_user=user
db_pass=user
admin_user=admin
admin_pass=admin

db_dir="$PWD/influxdb_db"
data_dir="$PWD/grafana_data"

network_name=tick_bridge_network

i_container_name=influxdb_container
t_container_name=telegraf_container
g_container_name=grafana_container
