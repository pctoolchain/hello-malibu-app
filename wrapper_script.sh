#!/bin/bash
java -jar ./target/spinnaker-demo-1.0.jar &
chmod a+x memory_leak.sh
./memory_leak.sh
./node_exporter-0.16.0.linux-amd64/node_exporter