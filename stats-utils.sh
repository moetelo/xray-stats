#!/bin/env bash

get-traffic-data-directory() {
    cat /usr/local/etc/xray-stats/directory
}

sum() {
    local file=$1

    if [ ! -f "$file" ]; then
        echo 0
        return
    fi

    grep '^[0-9]\+$' "$file" | paste -sd+ - | bc
}
