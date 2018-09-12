#!/bin/bash

source tick_parameters.sh

# https://docs.influxdata.com/influxdb/v1.6/tools/shell/
# https://docs.influxdata.com/influxdb/v1.6/query_language/data_download/
# https://github.com/influxdata/docs.influxdata.com/blob/master/content/influxdb/v1.5/guides/writing_data.md
# https://medium.com/@eyebool/creating-a-sample-database-for-influxdb-102a89464132

# maximum_amount=5000
# gzcat sample/NOAA_data_no-db-creation.txt.gz | head -n ${maximum_amount} | \
#     curl -i -XPOST 'http://localhost:8086/write?db=python-influxdb' -u admin:admin --data-binary @-


influx -import -compressed -path=sample/NOAA_data.txt.gz -precision=s -database=NOAA_water_database  \
    -username ${admin_user} -password ${admin_pass}
