#!/bin/bash

# Output server ID
echo "server id (myid): ${SERVER_ID}"
echo "${SERVER_ID}" > /tmp/zookeeper/myid

# Add additional ZooKeeper servers into the zoo.cfg file
echo "${ADDITIONAL_ZOOKEEPER_1}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_2}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_3}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_4}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_5}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_6}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_7}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_8}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_9}" >> $ZOO/conf/zoo.cfg
echo "${ADDITIONAL_ZOOKEEPER_10}" >> $ZOO/conf/zoo.cfg

# Start Zookeeper
$ZOO/bin/zkServer.sh start-foreground



