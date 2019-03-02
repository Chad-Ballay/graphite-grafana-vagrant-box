#!/bin/bash

CARBON_HOST="localhost"
CARBON_PORT="2003"
METRIC_NAME=`hostname`
TIMESTAMP=`date +%s`

CPU_STATS=`sar -u 1 1 | tail -1`

USER=`echo $CPU_STATS| awk '{ print $3 }'`
SYSTEM=`echo $CPU_STATS| awk '{ print $5 }'`
IDLE=`echo $CPU_STATS| awk '{ print $8 }'`

echo ${METRIC_NAME}.cpu.user $USER ${TIMESTAMP} | nc -N ${CARBON_HOST} ${CARBON_PORT}
echo ${METRIC_NAME}.cpu.system $SYSTEM ${TIMESTAMP} | nc -N ${CARBON_HOST} ${CARBON_PORT}
echo ${METRIC_NAME}.cpu.idle $IDLE ${TIMESTAMP} | nc -N ${CARBON_HOST} ${CARBON_PORT}
 

