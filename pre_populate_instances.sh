#!/bin/bash

for i in {1..30}; do
    cp ~/mt5-docker/configs/mt5-config.ini ~/mt5-docker/data/mt5-instance-$i/
    cp ~/mt5-docker/configs/trading-bot.mq5 ~/mt5-docker/data/mt5-instance-$i/
done
