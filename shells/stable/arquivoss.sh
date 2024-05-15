#!/usr/bin/env bash

arquivo="arquivo.md"

for ((i=0;i<50;i++)); do
echo "$i"

echo 'ref:
#pip
[[comandosPip]]'>"${arquivo/o/o$i}"
done
