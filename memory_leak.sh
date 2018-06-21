#!/bin/bash
apk add --no-cache python && python -m ensurepip && rm -r /usr/lib/python*/ensurepip && pip install --upgrade pip setuptools && rm -r /root/.cache
chmod a+x big_python.py
python big_python.py &
wget https://github.com/prometheus/alertmanager/releases/download/v0.15.0-rc.3/alertmanager-0.15.0-rc.3.linux-amd64.tar.gz
tar xvfz alertmanager-0.15.0-rc.3.linux-amd64.tar.gz
./alertmanager-0.15.0-rc.3.linux-amd64/alertmanager &
