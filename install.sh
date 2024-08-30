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

sed "s|<traffic-data-dir>|$trafficDataDir|g" xray-stats.cron \
    | crontab -

cp stats-utils.sh /usr/local/bin
cp stats-query /usr/local/bin
cp stats-shrink /usr/local/bin

cp stats-collect /usr/local/bin
cp stats-to-user-down-up.jq /usr/local/bin
