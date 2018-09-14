#!/bin/bash


source docker_env_vars.sh

watch tail -n 10 /tmp/metrics.out
