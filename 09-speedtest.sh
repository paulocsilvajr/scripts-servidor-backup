#!/usr/bin/env bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name speedtest)

function speedtest {

    speedtest-cli --json

}

criar_pasta_log

speedtest | tee -a $LOGNAME