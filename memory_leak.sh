#!/bin/bash
wget https://github.com/prometheus/alertmanager/releases/download/v0.15.0-rc.3/alertmanager-0.15.0-rc.3.linux-amd64.tar.gz
tar xvfz alertmanager-0.15.0-rc.3.linux-amd64.tar.gz
./alertmanager-0.15.0-rc.3.linux-amd64/alertmanager &
