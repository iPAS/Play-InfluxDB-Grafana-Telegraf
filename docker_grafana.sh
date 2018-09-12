#!/bin/bash
# http://docs.grafana.org/installation/docker/

source tick_parameters.sh

[[ ! -d "${data_dir}" ]] && echo "'${data_dir}' does NOT existed, then create." && mkdir -p "${data_dir}"

## To install new plugins, please insert theirs names after the equal sign:
#plugins="-e GF_INSTALL_PLUGINS="

# starts grafana with your user id and using the data folder
docker run --name=${g_container_name} --net=${network_name} --rm ${user}  \
    -e "GF_SERVER_ROOT_URL=http://localhost"  \
    -e "GF_SECURITY_ADMIN_PASSWORD=${admin_pass}"  \
    ${plugins}  \
    -p 3000:3000  \
    -v "${data_dir}:/var/lib/grafana"  \
    grafana/grafana
