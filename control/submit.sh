#!/bin/bash

if [ -z "$FLEETCTL_TUNNEL" ]; then
    echo
    echo "You must set FLEETCTL_TUNNEL (a resolvable address to one of your CoreOS instances)"
    echo "e.g.:"
    echo "export FLEETCTL_TUNNEL=1.2.3.4"
    echo
    exit 1
fi

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
cd $SCRIPT_PATH/units

echo "Submitting units"
echo "================"
fleetctl submit logspout
fleetctl submit logrotate
fleetctl submit registrator
fleetctl submit skydns
fleetctl submit influxdb{,.volumes}@
fleetctl submit influxdb.create_db
fleetctl submit cadvisor
fleetctl submit sysinfo_influxdb
fleetctl submit zookeeper{,.placement}@
fleetctl submit kafka{,.volumes}@
fleetctl submit kafka.create_topics
fleetctl submit syslog_gollector
fleetctl submit elasticsearch{,.volumes}@
fleetctl submit logstash@

fleetctl submit vulcand{,.elb}@
