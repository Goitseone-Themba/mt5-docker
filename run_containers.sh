#!/bin/bash

for i in {1..30}; do
    docker run -d --name mt5-instance-$i -v ~/mt5-docker/data/mt5-instance-$i:/app/MetaTrader5
done
