#!/usr/bin/env bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name speedtest)

function speedtest {

    speedtest-cli --json

}

echo $(data_hora) | tee -a $LOGNAME

criar_pasta_log
speedtest | tee -a $LOGNAME

echo -e $(data_hora)"\n" | tee -a $LOGNAME