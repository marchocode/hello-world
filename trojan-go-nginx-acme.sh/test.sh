#!/usr/bin/env bash

h1() {
    echo "11"
    return 1
}

while h1
do
    echo "..."
    sleep 1
done