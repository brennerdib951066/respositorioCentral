#!/usr/bin/env bash

lista="$(ls *.xlsx)"

readarray -t listaNova <<< "$lista"
echo "${listaNova}"
echo "${#listaNova[@]}"

i="1"
until [[ "$i" = "${#listaNova[@]}" ]]; do
    for converter in "${listaNova[@]}"; do
        read -p "$converter" converter[$i]
        ssconvert "$converter" "${converter%.xlsx}.csv"

    done
    ((i++))
done
