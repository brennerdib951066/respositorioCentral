#!/usr/bin/env bash

(($UID!=0)) && { echo "Precisa ser root para fazer isso" ; exit 1 ;}
atualizar=$(apt list --upgradable 2>&- | tail -n5 | cut -d'/' -f'1')

apt update -y
for sistema in $atualizar; do apt upgrade $sistema -y;

done
