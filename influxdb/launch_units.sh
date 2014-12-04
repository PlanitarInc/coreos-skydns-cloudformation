#!/bin/bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )
cd $SCRIPT_PATH

# Add the service templates to Fleet
fleetctl submit influxdb@.service
fleetctl submit influxdb.create_db@.service
fleetctl submit influxdb.presence@.service
# fleetctl submit influxdb.elb@.service
# Start instantiated units from the templates (+ a number)
fleetctl start influxdb@1.service
fleetctl start influxdb.create_db@1.service
fleetctl start influxdb.presence@1.service
# fleetctl start influxdb.elb@1.service
