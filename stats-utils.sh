#!/bin/env bash

# shellcheck disable=SC2034 # Used in the sourcing scripts.
TRAFFIC_DIR=$(</usr/local/etc/xray-stats/directory)

sum-num-file() {
    local file=$1
    if [[ ! -f "$file" ]]; then
        echo 0
        return
    fi

    local total=0
    while IFS= read -r line; do
        if [[ "$line" =~ ^[0-9]+$ ]]; then
            total=$((total + line))
        fi
    done < "$file"

    echo "$total"
}
