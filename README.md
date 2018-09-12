
# InfluxDB

* To make a configuration file:

> docker run --rm influxdb influxd config > influxdb.conf

* To begin an InfluxDB database:

> docker_influxdb_init.sh

* To run:

> docker_influxdb.sh

* After the InfluxDB server was run, able to login at prompt with:

> docker_influxdb_client.sh

* To send query to the server:

> docker_influxdb_query.sh

* You also be able to add data from a file in line-protocol format to the time-series database, 
    with:

> write_file_influxdb.sh

where in this script, a default line-protocol file is in the sample directory.


# Telegraf

Before other things else, please revise your telegraf.conf.
Then, to start:

> docker_telegraf.sh


# Grafana

> docker_grafana.sh
