#!/bin/bash
java -jar ./target/spinnaker-demo-1.0.jar &
#./alertmanager-0.15.0-rc.3.linux-amd64/alertmanager &&
./node_exporter-0.16.0.linux-amd64/node_exporter
