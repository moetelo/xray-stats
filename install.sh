#!/bin/env bash

set -eo pipefail

DEFAULT_TRAFFIC_DATA_DIR=/usr/local/etc/traffic-data

trafficDataDir=$1

if [ -z $trafficDataDir ]; then
    echo "Usage: $0 <traffic-data-dir>"
    echo "Usage: $0 --default"
    echo "(defaults to $DEFAULT_TRAFFIC_DATA_DIR)"
    exit 1
fi

if [ $trafficDataDir == '--default' ]; then
    trafficDataDir=$DEFAULT_TRAFFIC_DATA_DIR
fi

mkdir -p /usr/local/etc/xray-stats
echo "$trafficDataDir" > /usr/local/etc/xray-stats/directory

cat xray-stats.cron | crontab -

cp stats-utils.sh stats-query stats-shrink stats-collect stats-to-user-down-up.jq \
    /usr/local/bin
