#!/bin/bash

source docker_env_vars.sh

## Run the command-line influx in the running container.
docker exec ${user} -it ${i_container_name}  \
    influx -username ${admin_user} -password ${admin_pass}
