#!/usr/bin/env bash

cal=1
while (( "$cal" < 6 )); do
    echo "o incremento é: $cal"
    ((cal++))
done
