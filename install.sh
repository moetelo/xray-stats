#!/bin/env bash

set -eo pipefail

trafficDataDir=$1

if [ -z $trafficDataDir ]; then
    echo "Usage: $0 <traffic-data-dir>"
    exit 1
fi

sed "s|<traffic-data-dir>|$trafficDataDir|g" xray-stats.cron \
    | crontab -

cp stats-utils.sh /usr/local/bin
cp stats-query /usr/local/bin
cp stats-shrink /usr/local/bin

cp stats-collect /usr/local/bin
cp stats-to-user-down-up.jq /usr/local/bin
