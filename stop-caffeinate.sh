#!/usr/bin/env bash

PIDS=$(ps -ef|grep caffeinate|grep -v grep|awk '{print $2}')
PID=$(echo ${PIDS}|awk '{print $1}')

kill ${PID}
