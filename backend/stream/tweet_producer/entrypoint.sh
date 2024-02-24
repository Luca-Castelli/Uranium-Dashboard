#!/bin/bash
set -e

# Wait for Zookeeper to become available
until nc -z zookeeper 2181; do
    echo "Waiting for Zookeeper to start..."
    sleep 1
done

# Wait for Kafka to become available
until nc -z kafka 9093; do
    echo "Waiting for Kafka to start..."
    sleep 1
done

# Wait for fake_twitter to become available
until nc -z fake_twitter 8000; do
    echo "Waiting for fake_twitter to start..."
    sleep 1
done

python app.py
