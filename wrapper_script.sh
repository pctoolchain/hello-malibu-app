#!/bin/bash
python -m SimpleHTTPServer 8000 &
java -jar ./target/spinnaker-demo-1.0.jar &
./node_exporter-0.16.0.linux-amd64/node_exporter
