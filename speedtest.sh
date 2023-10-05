#!/usr/bin/env bash

BASE=$(dirname $0)

cd $BASE

if [ ! -d log ]; then
    mkdir log
fi

datalog=$(date +%Y%m)
speedtest-cli --json >> log/${datalog}_speedtest.log
