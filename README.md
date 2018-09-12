
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


# Telegraf

Before other things else, please revise your telegraf.conf.
Then, to start:

> docker_telegraf.sh


# Grafana

> docker_grafana.sh
