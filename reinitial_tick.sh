#!/bin/bash


source docker_env_vars.sh

trash "${db_dir}"
trash "${data_dir}"
