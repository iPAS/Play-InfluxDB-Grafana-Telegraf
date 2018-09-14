#!/bin/bash
# https://docs.influxdata.com/influxdb/latest/query_language/spec/

source docker_env_vars.sh

q="${*}"
[[ "$q" == "" ]] && q="SHOW DATABASES"
echo "influxdb query> $q"

echo "exam: SHOW SERIES on ${db_name}"
echo "exam: SHOW MEASUREMENTS on ${db_name}"
echo "exam: SHOW USERS"
echo "exam: GRANT ALL on '${db_name}' TO '${admin_user}'"

auth="-u ${admin_user}:${admin_pass}"
pretty="--data-urlencode pretty=true"
# db="--data-urlencode db=${db_name}"

curl -i -X POST -G http://localhost:8086/query ${auth} ${db} ${pretty} --data-urlencode "q=$q" 
