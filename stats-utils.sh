#!/bin/env bash

get-traffic-data-directory() {
    cat /usr/local/etc/xray-stats/directory
}

sum() {
    local file=$1

    if [ ! -f $file ]; then
        return 1
    fi

    local sum=$(cat $file | paste -sd+ - | bc)
    echo $sum
}
