#!/bin/bash

source tick_parameters.sh

## Run the command-line influx in the running container.
docker exec ${user} -it ${i_container_name}  \
    influx -username ${admin_user} -password ${admin_pass}
