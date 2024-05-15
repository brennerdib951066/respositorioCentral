#!/usr/bin/env bash


echo -e "Esse é o paramtro 0: \E[31;1m$0\E[m"
echo -e "Esse é o paramtro 1: \E[31;1m$1\E[m"
shift
echo -e "Esse é o paramtro 2: \E[31;1m$2\E[m"
IFS=,
echo "${*}"
