#!/bin/sh

# call docker secret expansion in env variables
source /docker/set_env_secrets.sh

if [ "${1:0:1}" = '-' ]; then
    set -- mattermost "$@"
fi

exec "$@"

mattermost