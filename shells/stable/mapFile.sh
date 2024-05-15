#!/usr/bin/env bash


mapfile -t linhas < comandos.sh

m=0
for mapenado in "${linhas[@]}"; do
    sleep 2s
    $mapenado
done
