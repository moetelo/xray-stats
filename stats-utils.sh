#!/bin/env bash

sum() {
    local file=$1

    if [ ! -f $file ]; then
        return 1
    fi

    local sum=$(cat $file | paste -sd+ - | bc)
    echo $sum
}
