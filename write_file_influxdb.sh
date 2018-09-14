#!/bin/bash

source docker_env_vars.sh

# https://docs.influxdata.com/influxdb/v1.6/tools/shell/
# https://docs.influxdata.com/influxdb/v1.6/query_language/data_download/
# https://github.com/influxdata/docs.influxdata.com/blob/master/content/influxdb/v1.5/guides/writing_data.md
# https://medium.com/@eyebool/creating-a-sample-database-for-influxdb-102a89464132

# maximum_amount=5000
# gzcat sample/NOAA_data_no-db-creation.txt.gz | head -n ${maximum_amount} | \
#     curl -i -XPOST 'http://localhost:8086/write?db=python-influxdb' -u admin:admin --data-binary @-

input_file=$1
[[ "${input_file}" == "" ]] && input_file=sample/NOAA_data.txt.gz
database_name=$(basename ${input_file})
echo "Input file: '${input_file}'"
echo "Database: '${database_name}'"

influx -import -compressed  \
    -path="${input_file}" -precision=s -database="${database_name}"  \
    -username ${admin_user} -password ${admin_pass}
